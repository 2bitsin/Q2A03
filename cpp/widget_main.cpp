#include <cstdio>
#include <png++/png.hpp>
#include <VWidget.h>

#include "utilities.hpp"


static double $time = 0;

double sc_time_stamp()
{
  return $time;
}

template <auto Y_size, auto X_size, typename T_type>
void image_write(unsigned index, const T_type (&data) [Y_size][X_size])
{
  using namespace png;  
  char name_buffer [2048];
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

int main(int argc, char** argv)
{
  Verilated::commandArgs(argc, argv);
  Verilated::traceEverOn(false);

  Vwidget widget;

  widget.I_sys_clock = 0;
  widget.I_sys_reset = 0;
  for(auto i = 0; i < 64; ++i) {
    widget.I_sys_clock ^= 1;
    widget.eval();
    $time += 1;
  }

  edge_det O_vid_blank { widget.O_vid_blank } ;
  edge_det O_vid_clock { widget.O_vid_clock } ;
  edge_det O_vid_hsync { widget.O_vid_hsync } ;
  edge_det O_vid_vsync { widget.O_vid_vsync } ;

  unsigned buff_x = 0;
  unsigned buff_y = 0;
  unsigned frame_index = 0;
  uint8_t buff[240][256][3];

  widget.I_sys_reset = 1;
  for(auto i = 0; i < 42'884'160; ++i) 
  {
    widget.I_sys_clock ^= 1;
    widget.eval();

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

    $time += 1;
  }
  auto res = system("ffmpeg -r 60 -f image2 -s 1280x1200 -i trace/img/%05d.png -filter:v scale=1536:1440:flags=neighbor -vcodec libx264 -pix_fmt rgb24 trace/trace.avi");
  //system("rm -rf trace/img/*.png");
  return 0;
}
