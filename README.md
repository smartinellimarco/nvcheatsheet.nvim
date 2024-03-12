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
    ['Oil'] = {
      { 'Toggle oil (closes without saving)', '<leader>q' },
      { 'Select entry', '⏎' },
      { 'Select entry', 'l' },
      { 'Go to parent', 'h' },
      { 'Open vertical split', '⌃v' },
      { 'Open horizontal split', '⌃x' },
      { 'Go to current working directory', '.' },
    },
    ['Cmp'] = {
      { 'Select entry', '⌃f' },
      { 'Next result - Jump to next snippet placeholder', '⌃n' },
      { 'Previous result - Jump to previous snippet placeholder', '⌃p' },
      { 'Scroll up in preview', '⌃u' },
      { 'Scroll down in preview', '⌃d' },
      { 'Abort autocompletion', '⌃e' },
    },
    ['Comment'] = {
      { 'Comment line toggle', 'gcc' },
      { 'Comment block toggle', 'gbc' },
      { 'Comment visual selection', 'gc' },
      { 'Comment visual selection using block delimiters', 'gb' },
      { 'Comment out text object line wise', 'gc<motion>' },
      { 'Comment out text object block wise', 'gb<motion>' },
      { 'Add comment on the line above', 'gcO' },
      { 'Add comment on the line below', 'gco' },
      { 'Add comment at the end of line', 'gcA' },
    },
  },
}

function M.config(_, opts)
  local nvcheatsheet = require('nvcheatsheet')

  nvcheatsheet.setup(opts)

  -- You can also close it with <Esc>
  vim.keymap.set('n', '<F1>', nvcheatsheet.toggle)
end

return M

-- vim: ts=2 sts=2 sw=2 et

```
### Highlights
This plugin requires your colorscheme to support these highlight groups:

```lua
local M = {}

function M.highlight(palette, opts)
  return {
    NvChAsciiHeader = { bg = palette.bg, fg = palette.fg }, -- Title
    NvChSection = { bg = palette.alt_bg }, -- Each card

    -- Colors for the headers
    NvCheatsheetWhite = { bg = palette.white, fg = palette.bg },
    NvCheatsheetGray = { bg = palette.gray, fg = palette.fg },
    NvCheatsheetBlue = { bg = palette.blue, fg = palette.bg },
    NvCheatsheetCyan = { bg = palette.cyan, fg = palette.bg },
    NvCheatsheetRed = { bg = palette.red, fg = palette.fg },
    NvCheatsheetGreen = { bg = palette.green, fg = palette.bg },
    NvCheatsheetYellow = { bg = palette.yellow, fg = palette.bg },
    NvCheatsheetOrange = { bg = palette.orange, fg = palette.bg },
    NvCheatsheetPurple = { bg = palette.purple, fg = palette.fg },
    NvCheatsheetMagenta = { bg = palette.magenta, fg = palette.bg },
  }
end

return M

-- vim: ts=2 sts=2 sw=2 et
```

### Credits

- [NvChad](https://nvchad.com/) - For providing the source code
