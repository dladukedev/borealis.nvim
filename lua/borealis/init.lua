local M = {}

M.style = {
  day = "day",
  night = "night",
}

local terminal_setup = function(theme)
  vim.g.terminal_color_0 = theme.black
  vim.g.terminal_color_8 = theme.black_bright

  -- light
  vim.g.terminal_color_7 = theme.white
  vim.g.terminal_color_15 = theme.white_bright

  -- colors
  vim.g.terminal_color_1 = theme.red
  vim.g.terminal_color_9 = theme.red_bright

  vim.g.terminal_color_2 = theme.green
  vim.g.terminal_color_10 = theme.green_bright

  vim.g.terminal_color_3 = theme.yellow
  vim.g.terminal_color_11 = theme.yellow_bright

  vim.g.terminal_color_4 = theme.blue
  vim.g.terminal_color_12 = theme.blue_bright

  vim.g.terminal_color_5 = theme.magenta
  vim.g.terminal_color_13 = theme.magenta_bright

  vim.g.terminal_color_6 = theme.cyan
  vim.g.terminal_color_14 = theme.cyan_bright
end

M.setup = function(style)
  local colors = require('borealis.colors').get_colors(style)

  local editor_theme = require('borealis.theme').build_editor_theme(colors)
  local term_theme = require('borealis.theme').build_terminal_theme(colors)

  local groups = require('borealis.highlights').highlights(editor_theme)

  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "borealis-" .. style

  for group, hl in pairs(groups) do
    vim.api.nvim_set_hl(0, group, hl)
  end

  terminal_setup(term_theme)
end

M.build_extras = function()
  for _, style in pairs(M.style) do
    local colors = require('borealis.colors').get_colors(style)
    local theme = require('borealis.theme').build_theme(colors)

    require('borealis.extras').build(style, theme)
  end
end

return M
