local M = {}

local write = function(file, contents)
  vim.fn.mkdir(vim.fn.fnamemodify(file, ":h"), "p")
  local fd = assert(io.open(file, "w+"))
  fd:write(contents)
  fd:close()
end

local name_pattern = '{NAME}'

local files = {
  coteditor = { module = "coteditor", dir = "coteditor", filename = name_pattern .. ".cottheme" },
  ghostty = { module = "ghostty", dir = "ghostty", filename = name_pattern },
}


local build_single = function(theme, style, file_info)
  local name = 'borealis-' .. style

  local file_name = string.gsub(file_info.filename, name_pattern, name)
  local file_content = require('borealis.extras.' .. file_info.module).build(theme)
  local path = 'extras/' .. file_info.dir .. '/' .. file_name

  write(path, file_content)
end

M.build = function(style, theme)
  for _, info in pairs(files) do
    build_single(theme, style, info)
  end
end

return M
