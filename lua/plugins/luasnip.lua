-- Introductory video to snippet construction/functionality can be found below

-- https://www.youtube.com/watch?v=FmHhonPjvvA

local ls = require 'luasnip';
local s = ls.snippet;
local i = ls.insert_node;
local fmt = require('luasnip.extras.fmt').fmt;
local c = ls.choice;

-- Rust println
ls.add_snippets("rust", {
  s("rpv", fmt(
    [[
      println!("{}{{:#?}}",{});
    ]],
    { i(1), i(2) }
  )),
  s("rp", fmt(
    [[
      println!("{}");
    ]],
    {i(1)}
  )),
  s("rifelse", fmt(
    [[
      if {{ 
          {} 
      }} else {{
          {} 
      }};
    ]],
    {i(1), i(2)}
  ))
})

