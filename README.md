#  Borealis.nvim

A dark and light [Neovim](https://github.com/neovim/neovim) theme written in
[Lua](https://www.lua.org) pulling colors from [Nord Theme](https://www.nordtheme.com/) with a darker background and color usage inspired by [Kanagawa Dragon](https://github.com/rebelot/kanagawa.nvim).

## Preview

<table width="100%">
  <tr>
    <th>Night</th>
    <th>Day</th>
  </tr>
  <tr>
    <td width="50%">
      <img width="1774" height="1119" alt="Screenshot 2025-08-05 at 8 48 59 PM" src="https://github.com/user-attachments/assets/b8cbedf0-df10-41ea-a49a-86eaa7aee834" />
    </td>
    <td width="50%">
      <img width="1774" height="1119" alt="Screenshot 2025-08-05 at 8 49 44 PM" src="https://github.com/user-attachments/assets/fca4fc65-cbb1-4c90-9a99-9f91fa651509" />
    </td>
  </tr>
</table>

## Features

- Terminal Colors
- Extensible
- Extras - [Find them here](extras)

## Installation

#### Lazy
```lua
return {
    'dladukedev/borealis.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
}
```

#### Mini.Deps
```lua
MiniDeps.add('dladukedev/borealis.nvim')
```

#### vim.pack
```lua
vim.pack.add({'https://github.com/dladukedev/borealis.nvim'})
```

Calling `setup()` is optional if you just want the default values.

## Usage

```lua
vim.cmd.colorscheme('borealis-night')
-- OR
vim.cmd.colorscheme('borealis-day')
```

## Configuration

```lua
require('borealis').setup({
  -- Load a theme on setup - 'day' or 'night'
  default_theme = nil,
  -- override builtin colors
  base_colors = {},
  -- override generated colors
  override_colors = function(colors) return colors end,
  -- override generated theme
  override_theme = function(colors, theme) return theme end,
  -- add custom highlights and/or override highlights
  custom_highlights = function(colors, theme) return {} end,
  -- enable term colors from colorscheme
  use_term_colors = true
})
```

## Helpful Functions

```lua
-- Toggle Between Day and Night
require('borealis').toggle_colorscheme()

-- Set Day Color scheme Programmatically
require('borealis').load_day()

-- Set Night Color scheme Programmatically
require('borealis').load_night()

-- Build Extras Folder
require('borealis').build_extras()
```

Also available as User Commands

```vim
" Toggle Between Day and Night
:Borealis toggle-theme

" Set Day Color scheme Programmatically
:Borealis day

" Set Night Color scheme Programmatically
:Borealis night

" Build Extras Folder
:Borealis build-extras
```

## Extras

Configuration files for terminals, applications, etc

- [Ghostty](extras/ghostty) - [learn more](https://github.com/ghostty-org/ghostty)
- [Windows Terminal & Theme](extras/windows_term) - [learn more](https://github.com/microsoft/terminal)
- [Coteditor](extras/coteditor) - [learn more](https://github.com/coteditor/CotEditor)

## Similar Themes

- [nordic.nvim](https://github.com/AlexvZyl/nordic.nvim)
- [onenord.nvim](https://github.com/rmehri01/onenord.nvim)
- [nord.nvim](https://github.com/shaunsingh/nord.nvim)
