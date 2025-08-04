local extra_utils = require('borealis.extras.utils')
local utils = require('borealis.utils')

local M = {}

M.build = function(theme)
  theme.name = theme.style == utils.style.day and "Day" or "Night"

  local windows_term = extra_utils.template(
    [[{
  "name": "Borealis ${name}",

  "cursorColor": "${editor.fg}",
  "selectionBackground": "${editor.selection}",

  "background": "${editor.bg}",
  "foreground": "${editor.fg}",

  "black": "${terminal.black}",
  "red": "${terminal.red}",
  "green": "${terminal.green}",
  "yellow": "${terminal.yellow}",
  "blue": "${terminal.blue}",
  "purple": "${terminal.magenta}",
  "cyan": "${terminal.cyan}",
  "white": "${terminal.white}",

  "brightBlack": "${terminal.black_bright}",
  "brightRed": "${terminal.red_bright}",
  "brightGreen": "${terminal.green_bright}",
  "brightYellow": "${terminal.yellow_bright}",
  "brightBlue": "${terminal.blue_bright}",
  "brightPurple": "${terminal.magenta_bright}",
  "brightCyan": "${terminal.cyan_bright}",
  "brightWhite": "${terminal.white_bright}"
}]], theme)
  return windows_term
end

return M
