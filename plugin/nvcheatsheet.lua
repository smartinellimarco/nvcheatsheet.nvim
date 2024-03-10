M = {}

local default_settings = {
  header = {
    '                                      ',
    '                                      ',
    '                                      ',
    '█▀▀ █░█ █▀▀ ▄▀█ ▀█▀ █▀ █░█ █▀▀ █▀▀ ▀█▀',
    '█▄▄ █▀█ ██▄ █▀█ ░█░ ▄█ █▀█ ██▄ ██▄ ░█░',
    '                                      ',
    '                                      ',
    '                                      ',
  },
  keymaps = {},
}

M.opts = {}

function M.setup(opts)
  M.opts = vim.tbl_deep_extend('force', default_settings, opts or {})
end

function M.open()
  require('nvcheatsheet')(M.opts['header'], M.opts['keymaps'])
end

return M

-- vim: ts=2 sts=2 sw=2 et
