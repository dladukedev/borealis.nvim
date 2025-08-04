local utils = require('borealis.utils')

local M = {}

M.default_base_colors = {
  black = '#111111',
  white = '#EEEEEE',

  fg_dark = '#D8DEE9',
  bg_dark = '#212121',

  fg_light = '#414858',
  bg_light = '#E5E9F0',

  red = "#BF616A",
  orange = '#D08770',
  yellow = '#EBCB8B',
  dark_yellow = '#DCA434',
  green = "#A3BE8C",
  cyan = "#88C0D0",
  blue = "#81A1C1",
  dark_blue = "#5E81AC",
  magenta = "#B48EAD",
}

local mix = function(color1, color2, ratio)
  color1 = color1:gsub("^#", "")
  color2 = color2:gsub("^#", "")

  -- Extract RGB components
  local r1 = tonumber(color1:sub(1, 2), 16)
  local g1 = tonumber(color1:sub(3, 4), 16)
  local b1 = tonumber(color1:sub(5, 6), 16)

  local r2 = tonumber(color2:sub(1, 2), 16)
  local g2 = tonumber(color2:sub(3, 4), 16)
  local b2 = tonumber(color2:sub(5, 6), 16)

  -- Mix the colors (ratio * color1 + (1-ratio) * color2)
  local r = math.floor(ratio * r1 + (1 - ratio) * r2 + 0.5)
  local g = math.floor(ratio * g1 + (1 - ratio) * g2 + 0.5)
  local b = math.floor(ratio * b1 + (1 - ratio) * b2 + 0.5)

  -- Convert back to hex with proper formatting
  return string.format("#%02X%02X%02X", r, g, b)
end


local mix_color = function(color, base_colors)
  return {
    dark_highlight = mix(color, base_colors.bg_dark, 0.2),
    dark = mix(color, base_colors.bg_dark, 0.8),
    base = color,
    bright = mix(color, base_colors.bg_light, 0.8),
    bright_highlight = mix(color, base_colors.bg_light, 0.2),
  }
end

local mix_colors = function(opts)
  return {
    black = opts.base_colors.black,
    white = opts.base_colors.white,

    bg_light = opts.base_colors.bg_light,
    bg_dark = opts.base_colors.bg_dark,

    fg_light = opts.base_colors.fg_light,
    fg_dark = opts.base_colors.fg_dark,

    grey = {
      mix(opts.base_colors.white, opts.base_colors.black, 0.1),
      mix(opts.base_colors.white, opts.base_colors.black, 0.2),
      mix(opts.base_colors.white, opts.base_colors.black, 0.3),
      mix(opts.base_colors.white, opts.base_colors.black, 0.4),
      mix(opts.base_colors.white, opts.base_colors.black, 0.5),
      mix(opts.base_colors.white, opts.base_colors.black, 0.6),
      mix(opts.base_colors.white, opts.base_colors.black, 0.7),
      mix(opts.base_colors.white, opts.base_colors.black, 0.8),
      mix(opts.base_colors.white, opts.base_colors.black, 0.9),
    },

    red = mix_color(opts.base_colors.red, opts.base_colors),
    orange = mix_color(opts.base_colors.orange, opts.base_colors),
    yellow = mix_color(opts.base_colors.yellow, opts.base_colors),
    dark_yellow = mix_color(opts.base_colors.dark_yellow, opts.base_colors),
    green = mix_color(opts.base_colors.green, opts.base_colors),
    blue = mix_color(opts.base_colors.blue, opts.base_colors),
    dark_blue = mix_color(opts.base_colors.dark_blue, opts.base_colors),
    cyan = mix_color(opts.base_colors.cyan, opts.base_colors),
    magenta = mix_color(opts.base_colors.magenta, opts.base_colors),
  }
end

local mix_light_colors = function(opts)
  local mixed_colors = mix_colors(opts)

  return {
    style = utils.style.day,

    bg = mixed_colors.bg_light,
    fg = mixed_colors.fg_light,

    red = mixed_colors.red.base,
    orange = mixed_colors.orange.base,
    yellow = mixed_colors.dark_yellow.base,
    green = mixed_colors.green.base,
    blue = mixed_colors.blue.base,
    dark_blue = mixed_colors.dark_blue.base,
    cyan = mixed_colors.cyan.base,
    magenta = mixed_colors.magenta.base,

    grey1 = mixed_colors.grey[6],
    grey2 = mixed_colors.grey[5],
    grey3 = mixed_colors.grey[3],
    grey4 = mixed_colors.grey[2],

    red_highlight = mixed_colors.red.bright_highlight,
    orange_highlight = mixed_colors.orange.bright_highlight,
    yellow_highlight = mixed_colors.dark_yellow.bright_highlight,
    green_highlight = mixed_colors.green.bright_highlight,
    blue_highlight = mixed_colors.blue.bright_highlight,
    cyan_highlight = mixed_colors.cyan.bright_highlight,
    magenta_highlight = mixed_colors.magenta.bright_highlight,

    black = mixed_colors.black,
    white = mixed_colors.grey[9],

    black_bright = mixed_colors.grey[2],
    red_bright = mixed_colors.red.dark,
    green_bright = mixed_colors.green.dark,
    yellow_bright = mixed_colors.dark_yellow.dark,
    blue_bright = mixed_colors.blue.dark,
    magenta_bright = mixed_colors.magenta.dark,
    cyan_bright = mixed_colors.cyan.dark,
    white_bright = mixed_colors.white,
    orange_bright = mixed_colors.orange.dark,
  }
end

local mix_dark_colors = function(opts)
  local mixed_colors = mix_colors(opts)

  return {
    style = utils.style.night,

    bg = mixed_colors.bg_dark,
    fg = mixed_colors.fg_dark,

    red = mixed_colors.red.base,
    orange = mixed_colors.orange.base,
    yellow = mixed_colors.yellow.base,
    green = mixed_colors.green.base,
    blue = mixed_colors.blue.base,
    dark_blue = mixed_colors.dark_blue.base,
    cyan = mixed_colors.cyan.base,
    magenta = mixed_colors.magenta.base,

    grey1 = mixed_colors.grey[5],
    grey2 = mixed_colors.grey[6],
    grey3 = mixed_colors.grey[8],
    grey4 = mixed_colors.grey[9],

    red_highlight = mixed_colors.red.dark_highlight,
    orange_highlight = mixed_colors.orange.dark_highlight,
    yellow_highlight = mixed_colors.yellow.dark_highlight,
    green_highlight = mixed_colors.green.dark_highlight,
    blue_highlight = mixed_colors.blue.dark_highlight,
    cyan_highlight = mixed_colors.cyan.dark_highlight,
    magenta_highlight = mixed_colors.magenta.bright_highlight,

    black = mixed_colors.black,
    white = mixed_colors.grey[9],

    black_bright = mixed_colors.grey[2],
    red_bright = mixed_colors.red.bright,
    green_bright = mixed_colors.green.bright,
    yellow_bright = mixed_colors.yellow.bright,
    blue_bright = mixed_colors.blue.bright,
    magenta_bright = mixed_colors.magenta.bright,
    cyan_bright = mixed_colors.cyan.bright,
    white_bright = mixed_colors.white,
    orange_bright = mixed_colors.orange.bright,
  }
end

M.get_colors = function(style, opts)
  local colors = style == utils.style.day and mix_light_colors(opts) or mix_dark_colors(opts)

  colors = opts.override_colors(colors)

  return colors
end

return M
