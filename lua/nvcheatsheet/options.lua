local M = {}

local default_header = {
  '                                      ',
  '                                      ',
  '                                      ',
  '█▀▀ █░█ █▀▀ ▄▀█ ▀█▀ █▀ █░█ █▀▀ █▀▀ ▀█▀',
  '█▄▄ █▀█ ██▄ █▀█ ░█░ ▄█ █▀█ ██▄ ██▄ ░█░',
  '                                      ',
  '                                      ',
  '                                      ',
}

local default_opts = {
  header = default_header,
  keymaps = {},
}

function M.merge_defaults(opts)
  return vim.tbl_deep_extend('force', default_opts, opts or {})
end

return M

-- vim: ts=2 sts=2 sw=2 et
