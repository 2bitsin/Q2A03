#include <cstdio>
#include <ctime>
#include <sstream>
#include <iomanip>

#include <png++/png.hpp>
#include <Vwidget.h>
//#include <Vwidget__Dpi.h>

#include "utilities.hpp"

#ifndef SECONDS_TO_RUN
 #define SECONDS_TO_RUN 5
#endif

static double $time = 0;

double sc_time_stamp()
{
  return $time;
}

template <typename _What>
void dump_bits (const std::string& target_path, _What&& bits)
{
  std::ofstream ofs (target_path, std::ios::binary);
  ofs.write((const char*)std::addressof(bits), sizeof (bits));
}

template <auto Y_size, auto X_size, typename T_type>
void image_write(unsigned index, const T_type (&data) [Y_size][X_size])
{
  using namespace png;  
  char name_buffer [2048];
  std::printf("Writting frame %05u ...\n", index);
  std::sprintf(name_buffer, "./trace/img/%05u.png", index);
  image<rgb_pixel> _writer (X_size, Y_size);
  for (auto y = 0; y < Y_size; ++y)
  {
    for(auto x = 0; x < X_size; ++x)
    {
      auto&& [b, g, r] = data[y][x];
      _writer[y][x] = rgb_pixel(r, g, b);
    }
  }
  _writer.write(name_buffer);  
}

auto time_as_string(const char* fmt = "%Y-%m-%d_%H-%M-%S") -> std::string
{
  auto t = std::time(nullptr);
  auto tm = *std::localtime(&t);
  std::ostringstream oss;
  oss << std::put_time(&tm, fmt);
  return oss.str();
}

uint8_t joy_mux(bool select_high, uint8_t signals)
{
  if (select_high) 
    return (signals & 0b1111) | (((signals >> 4) & 0b11) << 4);
  else
    return (signals & 0b0011) | (((signals >> 6) & 0b11) << 4);
}

int main(int argc, char** argv)
{
  auto i = system("rm -rf trace/img/*.png");
  using namespace std::string_literals;

  std::ofstream raw_audio ("trace/wav/audio.raw", std::ios::binary);

  Verilated::commandArgs(argc, argv);
  Verilated::traceEverOn(true);

  Vwidget widget;

  widget.I_sys_clock = 0;
  widget.I_sys_reset = 0;
  for(auto i = 0; i < 64; ++i, ++$time) {
    widget.I_sys_clock ^= 1;
    widget.eval();
  }

  edge_det O_vid_blank { widget.O_vid_blank } ;
  edge_det O_vid_clock { widget.O_vid_clock } ;
  edge_det O_vid_hsync { widget.O_vid_hsync } ;
  edge_det O_vid_vsync { widget.O_vid_vsync } ;

  edge_det O_audio_wclk { widget.O_audio_wclk } ;
  edge_det O_audio_sclk { widget.O_audio_sclk } ;

  unsigned buff_x = 0;
  unsigned buff_y = 0;
  unsigned frame_index = 0;
  unsigned synced = 0;
  uint8_t buff[240][256][3];

  widget.I_sys_reset = 1;
  const auto Ticks_per_second = 42'884'160ull; 
  const auto Simulate_seconds = SECONDS_TO_RUN * 60.0 / 60.0 ;
  const auto Total_ticks = (unsigned long long)(Simulate_seconds * Ticks_per_second) ;

  uint32_t current_sample = 0;
  int wclk_delay = 0;

  uint8_t j0 = 0;
  uint8_t j1 = 0;

  for(auto i = 0; i < Total_ticks; ++i, ++$time) 
  {
    if (!(i % 4288416))
      std::printf("%u ticks passed...\n", i);

    widget.I_joy0_bits = joy_mux(widget.O_joy0_mode, (0x80 >> ((frame_index >> 2) & 7)) * ((frame_index >> 1) & 1));
    widget.I_joy1_bits = joy_mux(widget.O_joy1_mode, (0x80 >> ((frame_index >> 2) & 7)) * ((frame_index >> 1) & 1));

    widget.I_sys_clock ^= 1;
    widget.eval();


    if (!synced)
    {
      O_vid_clock.rising();
      O_vid_hsync.rising();
      if (O_vid_vsync.rising())
        ++synced;
      continue;
    }

    if (O_audio_sclk.rising())
    {
      current_sample <<= 1;
      current_sample |= uint16_t (!!widget.O_audio_data);
      if (wclk_delay) {
        raw_audio.write((const char*)&current_sample, sizeof(current_sample));
        current_sample = 0;
        wclk_delay = 0;
      }
    }

    if (O_audio_wclk.rising())
      wclk_delay = 1;

    if (O_vid_clock.rising())
    {
      if (widget.O_vid_blank)
      {
        if (buff_y < 240 && buff_x < 256)
        {
          buff[buff_y][buff_x][2] = widget.O_vid_red ;
          buff[buff_y][buff_x][1] = widget.O_vid_green ;
          buff[buff_y][buff_x][0] = widget.O_vid_blue  ;                               
        }
        ++buff_x;
      }
    }

    if (O_vid_hsync.falling())
    {
      if (buff_x > 0)
        ++buff_y;
      buff_x = 0;
    }

    if (O_vid_vsync.falling())
    {
      if (buff_y > 0)
      {
        image_write(frame_index, buff);
      }
      ++frame_index;
      buff_y = 0;    
    }   
  }

  
  dump_bits("trace/video.mem", widget.widget__DOT__inst_video_memory__DOT__bits);
  dump_bits("trace/core.mem", widget.widget__DOT__inst_core_memory__DOT__bits);
  dump_bits("trace/object.mem", widget.widget__DOT__inst_video__DOT__pri_oam_bits);


  auto cmd = "ffmpeg -r 60 -f image2 -s 1280x1200 -i trace/img/%05d.png -f s16le -ar 83896 -ac 2 -i trace/wav/audio.raw -filter:v scale=1536:1440:flags=neighbor -vcodec libx264 -pix_fmt rgb24 trace/"s + time_as_string() + ".avi"s;
  auto res = system(cmd.data());
  
  

  return 0;
}
