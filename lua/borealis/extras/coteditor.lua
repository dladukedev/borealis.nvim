local extra_utils = require('borealis.extras.utils')

local M = {}

M.build = function(theme)
  return extra_utils.template(
    [[{
  "attributes" : {
    "color" : "${editor.identifier}"
  },
  "background" : {
    "color" : "${editor.bg}"
  },
  "characters" : {
    "color" : "${editor.string}"
  },
  "commands" : {
    "color" : "${editor.keyword}"
  },
  "comments" : {
    "color" : "${editor.nontext}"
  },
  "highlight" : {
    "color" : "${editor.selection}",
    "usesSystemSetting" : true
  },
  "insertionPoint" : {
    "color" : "${editor.fg}",
    "usesSystemSetting" : true
  },
  "invisibles" : {
    "color" : "${editor.nontext}"
  },
  "keywords" : {
    "color" : "${editor.keyword}"
  },
  "lineHighlight" : {
    "color" : "${editor.fg}b3"
  },
  "numbers" : {
    "color" : "${editor.number}"
  },
  "selection" : {
    "color" : "${editor.selection}",
    "usesSystemSetting" : true
  },
  "strings" : {
    "color" : "${editor.string}"
  },
  "text" : {
    "color" : "${editor.fg}"
  },
  "types" : {
    "color" : "${editor.type}"
  },
  "values" : {
    "color" : "${editor.constant}"
  },
  "variables" : {
    "color" : "${editor.variable}"
  }
}
  ]], theme)
end

return M
