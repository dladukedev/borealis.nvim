local extra_utils = require('borealis.extras.utils')
local utils = require('borealis.utils')

local M = {}

M.build = function(theme)
  theme.name = theme.style == utils.style.day and "Day" or "Night"
  theme.applicationTheme = theme.style == utils.style.day and "light" or "dark"

  return extra_utils.template([[{
  "name": "Borealis ${name}",
  "tab": {
    "background": "${editor.bg}FF",
    "showCloseButton": "always",
    "unfocusedBackground": null
  },
  "tabRow": {
    "background": "${terminal.black}FF",
    "unfocusedBackground": "${terminal.black}FF"
  },
  "window": {
    "applicationTheme": "${applicationTheme}"
  }
}]], theme)
end

return M
