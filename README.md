<h1 align="center"> NvCheatsheet.nvim </h1>
<p align="center"><sup> NvChad cheatsheet as a stand-alone plugin </sup></p>

### Features

- Responsive and scrollable grid
- Customizable colors
- Define keymaps as a simple table
- Customizable header

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

  vim.keymap.set('n', '<leader>ch', nvcheatsheet.open())
end

return M

-- vim: ts=2 sts=2 sw=2 et

```

### Credits

- [NvChad](https://nvchad.com/) - For providing the code
