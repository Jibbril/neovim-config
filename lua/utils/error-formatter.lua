local function wrap_error(text, max_width)
  local lines = {}
  local line = ""

  for word in text:gmatch("[^%s]+") do     -- Matches non-space sequences
    if #word > max_width then
      -- Add a new line before the long word if the current line is not empty
      if #line > 0 then
        table.insert(lines, line)
        table.insert(lines, "")     -- Empty line before the long word
        line = ""
      end

      while #word > max_width do
        table.insert(lines, word:sub(1, max_width))
        word = word:sub(max_width + 1)
      end

      if #word > 0 then
        table.insert(lines, word)     -- Add the remaining part of the long word
        table.insert(lines, "")       -- Empty line after the long word
      end
    else
      if #line + #word + 1 > max_width then
        if #line > 0 then
          table.insert(lines, line)
          line = ""
        end
      end

      if #line > 0 then
        line = line .. " "
      end
      line = line .. word
    end
  end

  if #line > 0 then
    table.insert(lines, line)
  end

  return "\n" .. table.concat(lines, "\n")
end

return {
  wrap_error = wrap_error
}
