local M = {}

local build_terminal_theme = function(colors)
  return {
    black = colors.black,
    red = colors.red,
    green = colors.green,
    yellow = colors.yellow,
    blue = colors.blue,
    magenta = colors.magenta,
    cyan = colors.cyan,
    white = colors.white,
    black_bright = colors.black_bright,
    red_bright = colors.red_bright,
    green_bright = colors.green_bright,
    yellow_bright = colors.yellow_bright,
    blue_bright = colors.blue_bright,
    magenta_bright = colors.magenta_bright,
    cyan_bright = colors.cyan_bright,
    white_bright = colors.white_bright,
    extended1 = colors.orange,
    extended2 = colors.orange_bright,
  }
end

local build_editor_theme = function(colors)
  return {
    fg         = colors.fg,
    fg_dim     = colors.grey2,
    nontext    = colors.grey1,
    bg         = colors.bg,

    variable   = colors.grey3,

    number     = colors.magenta,
    string     = colors.green,
    identifier = colors.yellow,
    fun        = colors.cyan,
    keyword    = colors.dark_blue,
    type       = colors.blue,
    constant   = colors.magenta,
    special    = colors.blue,

    selection  = colors.blue_highlight,

    highlight  = colors.grey4,

    add        = colors.green,
    delete     = colors.red,
    change     = colors.yellow,

    add_bg     = colors.green_highlight,
    delete_bg  = colors.red_highlight,
    change_bg  = colors.yellow_highlight,
    text_bg    = colors.blue_highlight,

    ok         = colors.green,
    error      = colors.red,
    warning    = colors.orange,
    info       = colors.blue,
    hint       = colors.cyan,
  }
end

M.build_theme = function(colors, opts)
  local theme = {
    style = colors.style,
    terminal = build_terminal_theme(colors),
    editor = build_editor_theme(colors),
  }

  theme = opts.override_theme(colors, theme)

  return theme
end

return M
