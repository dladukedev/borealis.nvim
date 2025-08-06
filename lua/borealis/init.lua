local colors = require('borealis.colors')
local config = require('borealis.config')
local extras = require('borealis.extras')
local highlights = require('borealis.highlights')
local theme = require('borealis.theme')
local utils = require('borealis.utils')

local M = {}

local terminal_setup = function(terminal_theme)
  vim.g.terminal_color_0 = terminal_theme.black
  vim.g.terminal_color_8 = terminal_theme.black_bright

  -- light
  vim.g.terminal_color_7 = terminal_theme.white
  vim.g.terminal_color_15 = terminal_theme.white_bright

  -- colors
  vim.g.terminal_color_1 = terminal_theme.red
  vim.g.terminal_color_9 = terminal_theme.red_bright

  vim.g.terminal_color_2 = terminal_theme.green
  vim.g.terminal_color_10 = terminal_theme.green_bright

  vim.g.terminal_color_3 = terminal_theme.yellow
  vim.g.terminal_color_11 = terminal_theme.yellow_bright

  vim.g.terminal_color_4 = terminal_theme.blue
  vim.g.terminal_color_12 = terminal_theme.blue_bright

  vim.g.terminal_color_5 = terminal_theme.magenta
  vim.g.terminal_color_13 = terminal_theme.magenta_bright

  vim.g.terminal_color_6 = terminal_theme.cyan
  vim.g.terminal_color_14 = terminal_theme.cyan_bright
end

local load = function(style)
  if not config.opts.initialized then
    M.setup({})
  end

  local theme_colors = colors.get_colors(style, config.opts)

  local colorscheme_theme = theme.build_theme(theme_colors, config.opts)

  local groups = highlights.highlights(config.opts, theme_colors, colorscheme_theme)

  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "borealis-" .. style

  for group, hl in pairs(groups) do
    vim.api.nvim_set_hl(0, group, hl)
  end

  if config.opts.use_term_colors then
    terminal_setup(colorscheme_theme.terminal)
  end
end

M.build_extras = function()
  if not config.opts.initialized then
    M.setup({})
  end

  for _, style in pairs(utils.style) do
    local extras_colors = colors.get_colors(style, config.opts)
    local extras_theme = theme.build_theme(extras_colors, config.opts)

    extras.build(style, extras_theme)
  end
end

M.load_day = function()
  load(utils.style.day)
end

M.load_night = function()
  load(utils.style.night)
end

M.toggle_colorscheme = function()
  if vim.g.colors_name == 'borealis-night' then
    M.load_day()
  else
    M.load_night()
  end
end

M.setup = function(opts)
  config.opts.base_colors = colors.default_base_colors
  config.opts = vim.tbl_deep_extend('force', config.opts, opts or {})
  config.opts.initialized = true

  local commands = {
    ['toggle-theme'] = M.toggle_colorscheme,
    ['build-extras'] = M.build_extras,
    day = M.load_day,
    night = M.load_night,
  }

  vim.api.nvim_create_user_command('Borealis', function(args)
    if commands[args.args] then
      commands[args.args]()
    end
  end, {
    nargs = 1,
    complete = function()
      return { "toggle-theme", "build-extras", "day", "night" }
    end,
  })

  local default_theme = config.opts.default_theme

  if default_theme == utils.style.day then
    M.load_day()
  elseif default_theme == utils.style.night then
    M.load_night()
  elseif default_theme then
    vim.notify("Borealis: Failed to load default_theme with name '" .. default_theme .. "'", vim.log.levels.WARN)
  end
end

M.utils = utils

return M
