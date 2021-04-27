#pragma once

template <typename T>
struct edge_det
{
  edge_det(const T& curr): curr { curr } {}

  bool falling () 
  { 
    const auto r = prev && !curr;
    prev = curr;
    return r;
  }

  bool rising () 
  {
    const auto r = !prev && curr;
    prev = curr;
    return r;
  }

  const T& curr;
  T prev;
};