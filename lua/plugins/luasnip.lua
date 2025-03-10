-- Introductory video to snippet construction/functionality can be found below
-- https://www.youtube.com/watch?v=FmHhonPjvvA

local ls = require 'luasnip';
local s = ls.snippet;
local i = ls.insert_node;
local fmt = require('luasnip.extras.fmt').fmt;
local c = ls.choice;

ls.add_snippets("python", {
  s("ppv", fmt(
    [[
      print(f"{}{{{}}}");
    ]],
    { i(1), i(2) }
  )),

  s("pp", fmt(
    [[
      print("{}");
    ]],
    { i(1) }
  )),
})

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
      if {} {{ 
          {} 
      }} else {{
          {} 
      }};
    ]],
    {i(1), i(2), i(3)}
  )),

  s("st", fmt(
    [[
      "{}"
    ]],
    {i(1)}
  )),

  s("allowdead", fmt(
    [[
      #[allow(dead_code)] 
    ]],
    {}
  )),

  s("rfn", fmt(
    [[
      fn {}({}) -> {} {{
          {}
      }}
    ]],
    {i(1), i(2), i(3), i(4)}
  ))
})

