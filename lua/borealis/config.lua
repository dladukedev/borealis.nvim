local M = {}

M.opts = {
  default_theme = nil,
  base_colors = {},
  override_colors = function(colors)
    return colors
  end,
  override_theme = function(colors, theme)
    return theme
  end,
  custom_highlights = function(colors, theme)
    return {}
  end,
  use_term_colors = true
}

return M
