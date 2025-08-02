local M = {}

M.highlights = function(theme)
  return {
    -- Base
    Normal                           = { fg = theme.fg, bg = theme.bg },
    Secondary                        = { fg = theme.fg_dim },
    NonText                          = { fg = theme.nontext },
    HighlightText                    = { fg = theme.highlight, bold = true },
    Special                          = { fg = theme.special },
    Bold                             = { bold = true },

    -- Hidden
    Hidden                           = { bg = theme.bg },
    HiddenText                       = { fg = theme.bg },

    -- Search and Selection
    Visual                           = { bg = theme.selection },
    Cursor                           = { fg = theme.bg, bg = theme.fg },
    Search                           = { fg = theme.fg, bg = theme.selection },
    CurSearch                        = { fg = theme.bg, bg = theme.info },
    Substitute                       = { fg = theme.fg, bg = theme.change },

    -- Coding
    Function                         = { fg = theme.fun },
    Identifier                       = { fg = theme.identifier },
    Keyword                          = { fg = theme.keyword },
    Variable                         = { fg = theme.variable },
    Comment                          = { fg = theme.nontext, italic = true },
    Constant                         = { fg = theme.constant },
    String                           = { fg = theme.string },
    Number                           = { fg = theme.number },
    Statement                        = { fg = theme.special },
    Type                             = { fg = theme.type },

    -- Message Context
    Error                            = { fg = theme.error },
    Info                             = { fg = theme.info },
    Warn                             = { fg = theme.warning },
    Hint                             = { fg = theme.hint },
    Ok                               = { fg = theme.ok },
    UnderlineError                   = { undercurl = true, sp = theme.error },
    UnderlineWarn                    = { undercurl = true, sp = theme.warning },
    UnderlineInfo                    = { undercurl = true, sp = theme.info },
    UnderlineHint                    = { undercurl = true, sp = theme.hint },

    -- Diff
    Added                            = { fg = theme.add },
    Removed                          = { fg = theme.delete },
    Changed                          = { fg = theme.change },
    AddStaged                        = { fg = theme.add, bold = true },
    RemoveStaged                     = { fg = theme.delete, bold = true },
    ChangeStaged                     = { fg = theme.change, bold = true },
    DiffAdd                          = { bg = theme.add_bg },
    DiffChange                       = { bg = theme.change_bg },
    DiffDelete                       = { bg = theme.delete_bg },
    DiffText                         = { bg = theme.text_bg },

    -- Other Linked
    Operator                         = { link = "Keyword" },
    Whitespace                       = { link = "NonText" },
    Delimiter                        = { link = "NonText" },
    PreProc                          = { link = "Keyword" },
    Ignore                           = { link = "NonText" },
    QuickFixLine                     = { link = "lineNr" },
    qfFileName                       = { link = "Directory" },
    SpecialKey                       = { link = "Special" },
    Conceal                          = { link = "NonText" },
    Directory                        = { link = "Keyword" },

    -- Messages
    MsgArea                          = { link = 'StatusLine' },
    ModeMsg                          = { link = "NonText" },
    MoreMsg                          = { link = "Info" },
    Question                         = { link = "Info" },
    ErrorMsg                         = { link = "Error" },
    WarningMsg                       = { link = "Warn" },

    -- UI
    lCursor                          = { link = "Cursor" },
    CursorLine                       = { link = "Hidden" },
    CursorLineNr                     = { link = "HighlightText" },
    EndOfBuffer                      = { link = "HiddenText" },
    Folded                           = { link = "HighlightText" },
    FoldColumn                       = { link = "NonText" },
    LineNr                           = { link = "Secondary" },
    MatchParen                       = { link = "HighlightText" },
    SignColumn                       = { link = "Keyword" },
    StatusLine                       = { link = "Secondary" },
    StatusLineNC                     = { link = "NonText" },
    Title                            = { link = "HighlightText" },
    WinSeparator                     = { link = "NonText" },
    WinBar                           = { link = "Secondary" },
    WinBarNC                         = { link = "NonText" },

    -- Floats & Menus
    FloatBorder                      = { link = "NonText" },
    FloatTitle                       = { link = "NonText" },
    FloatFooter                      = { link = "NonText" },
    NormalFloat                      = { link = 'Normal' },
    Pmenu                            = { link = 'NormalFloat' },
    PmenuSel                         = { link = "Visual" },
    PmenuSbar                        = { link = "NonText" },
    PmenuThumb                       = { link = "NonText" },

    -- Spell Check
    SpellBad                         = { link = "UnderlineError" },
    SpellCap                         = { link = "UnderlineWarn" },
    SpellLocal                       = { link = "UnderlineWarn" },
    SpellRare                        = { link = "UnderlineWarn" },

    -- Diagnostics
    DiagnosticError                  = { link = "Error" },
    DiagnosticWarn                   = { link = "Warn" },
    DiagnosticInfo                   = { link = "Info" },
    DiagnosticHint                   = { link = "Hint" },
    DiagnosticOk                     = { link = "Ok" },
    DiagnosticUnderlineError         = { link = "UnderlineError" },
    DiagnosticUnderlineWarn          = { link = "UnderlineWarn" },
    DiagnosticUnderlineInfo          = { link = "UnderlineInfo" },
    DiagnosticUnderlineHint          = { link = "UnderlineHint" },

    -- LSP
    ["@variable"]                    = { link = "Variable" },
    ["@variable.member"]             = { link = "Identifier" },
    ["@constructor.lua"]             = { link = "NonText" },
    ["@lsp.type.variable"]           = { fg = "none" },
    ["@lsp.typemod.variable.global"] = { link = "Constant" },
    ["@lsp.typemod.variable.static"] = { link = "Constant" },

    -- Telescope
    TelescopeResultsClass            = { link = "Type" },
    TelescopeResultsStruct           = { link = "Type" },
    TelescopeResultsField            = { link = "@variable.member" },
    TelescopeResultsMethod           = { link = "@function.method" },
    TelescopeResultsVariable         = { link = "@variable" },

    -- Mini.Pick
    MiniPickMatchCurrent             = { link = "Visual" },
    MiniPickMatchMarked              = { link = "Bold" },

    -- BlinkCmp
    BlinkCmpKind                     = { link = "Secondary" },
    BlinkCmpKindText                 = { link = "Normal" },
    BlinkCmpKindMethod               = { link = "@function.method" },
    BlinkCmpKindFunction             = { link = "Function" },
    BlinkCmpKindConstructor          = { link = "@constructor" },
    BlinkCmpKindField                = { link = "@variable.member" },
    BlinkCmpKindVariable             = { link = "@variable" },
    BlinkCmpKindClass                = { link = "Type" },
    BlinkCmpKindInterface            = { link = "Type" },
    BlinkCmpKindModule               = { link = "@module" },
    BlinkCmpKindProperty             = { link = "@property" },
    BlinkCmpKindUnit                 = { link = "Number" },
    BlinkCmpKindValue                = { link = "String" },
    BlinkCmpKindEnum                 = { link = "Type" },
    BlinkCmpKindKeyword              = { link = "Keyword" },
    BlinkCmpKindSnippet              = { link = "Special" },
    BlinkCmpKindColor                = { link = "Special" },
    BlinkCmpKindFile                 = { link = "Directory" },
    BlinkCmpKindReference            = { link = "Special" },
    BlinkCmpKindFolder               = { link = "Directory" },
    BlinkCmpKindEnumMember           = { link = "Constant" },
    BlinkCmpKindConstant             = { link = "Constant" },
    BlinkCmpKindStruct               = { link = "Type" },
    BlinkCmpKindEvent                = { link = "Type" },
    BlinkCmpKindOperator             = { link = "Operator" },
    BlinkCmpKindTypeParameter        = { link = "Type" },
    BlinkCmpKindCopilot              = { link = "String" },

    -- GitSigns
    GitSignsStagedAdd                = { link = "AddStaged" },
    GitSignsStagedDelete             = { link = "RemoveStaged" },
    GitSignsStagedChange             = { link = "ChangeStaged" },
  }
end

return M
