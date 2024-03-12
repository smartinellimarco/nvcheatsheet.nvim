<h1 align="center"> NvCheatsheet.nvim </h1>
<p align="center"> NvChad cheatsheet as a stand-alone plugin </p>
<p align="center">
  <img width="950" alt="Screenshot 2024-03-12 at 00 04 16" src="https://github.com/smartinellimarco/nvcheatsheet.nvim/assets/15314838/594df263-6602-4569-8f2f-2b5bff6e16e3">
</p>

### Features

- Customizable header
- Customizable colors
- Responsive and scrollable grid
- Define keymaps as a simple table

### Installation

- With [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
local M = { 'smartinellimarco/nvcheatsheet.nvim' }

M.opts = {
  -- Default header
  header = {
    "                                      ",
    "                                      ",
    "                                      ",
    "█▀▀ █░█ █▀▀ ▄▀█ ▀█▀ █▀ █░█ █▀▀ █▀▀ ▀█▀",
    "█▄▄ █▀█ ██▄ █▀█ ░█░ ▄█ █▀█ ██▄ ██▄ ░█░",
    "                                      ",
    "                                      ",
    "                                      ",
  },
  -- Example keymaps
  keymaps = {
    Comment = {
      { 'Insert end of line', 'gcA' },
      { 'Insert above', 'gcO' },
      { 'Insert below', 'gco' },
      { 'Toggle current block', 'gbc' },
      { 'Toggle current line', 'gcc' },
      { 'Toggle blockwise', 'gb' },
      { 'Toggle linewise', 'gc' },
    },
    ['Comment (x)'] = {
      { 'Toggle blockwise (visual)', 'gb' },
      { 'Toggle linewise (visual)', 'gc' },
    },
  },
}

function M.config(_, opts)
  local nvcheatsheet = require('nvcheatsheet')

  nvcheatsheet.setup(opts)

  vim.keymap.set('n', '<F1>', nvcheatsheet.toggle)
end

return M

-- vim: ts=2 sts=2 sw=2 et

```
### Highlights
This plugin requires support from your colorscheme, for the following highlight groups:

```lua
-- Example snippet
{
    NvChSection = { bg = palette.alt_bg },
    NvCheatsheetWhite = { bg = palette.white, fg = palette.bg },
    NvCheatsheetGray = { bg = palette.gray, fg = palette.fg },
    NvCheatsheetBlue = { bg = palette.blue, fg = palette.bg },
    NvCheatsheetGrayBlue = { bg = palette.gray_blue, fg = palette.bg },
    NvCheatsheetMediumGrayBlue = { bg = palette.medium_gray_blue, fg = palette.fg },
    NvCheatsheetCyan = { bg = palette.cyan, fg = palette.bg },
    NvCheatsheetRed = { bg = palette.red, fg = palette.fg },
    NvCheatsheetGreen = { bg = palette.green, fg = palette.bg },
    NvCheatsheetYellow = { bg = palette.yellow, fg = palette.bg },
    NvCheatsheetOrange = { bg = palette.orange, fg = palette.bg },
    NvCheatsheetPurple = { bg = palette.purple, fg = palette.fg },
    NvCheatsheetMagenta = { bg = palette.magenta, fg = palette.bg },
}
```

### Credits

- [NvChad](https://nvchad.com/) - For providing the code
