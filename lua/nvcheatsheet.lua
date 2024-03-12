local M = {}

local filetype = 'nvcheatsheet'

-- Since the buffer deletes itself when hidden
-- we need to set this variable to false too
vim.api.nvim_create_autocmd('BufWinLeave', {
  group = vim.api.nvim_create_augroup('nvcheatsheet', { clear = true }),
  callback = function()
    if vim.bo.ft == filetype then
      vim.g.nvcheatsheet_displayed = false
    end
  end,
})

function M.toggle()
  local drawer = require('nvcheatsheet.draw')

  -- Close the cheatsheet if its opened
  if vim.g.nvcheatsheet_displayed then
    local cheatsheet_buffer = vim.api.nvim_get_current_buf()

    vim.api.nvim_set_current_buf(vim.g.nvcheatsheet_previous_buffer)
    vim.api.nvim_buf_delete(cheatsheet_buffer, { force = true })
    vim.g.nvcheatsheet_displayed = false
    return
  end

  -- Save previous buffer ID
  vim.g.nvcheatsheet_previous_buffer = vim.api.nvim_get_current_buf()

  -- Create an empty buffer
  local buffer = vim.api.nvim_create_buf(false, true)

  -- Mark as displayed
  vim.g.nvcheatsheet_displayed = true

  -- Switch to the new buffer
  vim.api.nvim_set_current_buf(buffer)

  -- Draw the cheatsheet
  drawer.draw(buffer, M.opts['header'], M.opts['keymaps'])

  -- Configure the cheatsheet buffer
  vim.opt_local.bufhidden = 'delete'
  vim.opt_local.buflisted = false
  vim.opt_local.modifiable = false
  vim.opt_local.buftype = 'nofile'
  vim.opt_local.number = false
  vim.opt_local.list = false
  vim.opt_local.wrap = false
  vim.opt_local.relativenumber = false
  vim.opt_local.cursorline = false
  vim.opt_local.colorcolumn = '0'
  vim.opt_local.foldcolumn = '0'
  vim.opt_local.filetype = filetype

  -- Create a shortcut to hide and remove the cheatsheet buffer
  vim.keymap.set('n', '<Esc>', function()
    vim.api.nvim_set_current_buf(vim.g.nvcheatsheet_previous_buffer)
    vim.api.nvim_buf_delete(buffer, { force = true })
    vim.g.nvcheatsheet_displayed = false
  end, { buffer = buffer })
end

function M.setup(opts)
  local options = require('nvcheatsheet.options')

  -- Merge user options with defaults
  M.opts = options.merge_defaults(opts)
end

return M

-- vim: ts=2 sts=2 sw=2 et
