vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.cmd("set tabstop=4 smarttab")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set relativenumber")
--vim.opt.clipboard = 'unnamedplus'
vim.api.nvim_set_keymap('i', "''", '<C-x><C-o>',{})
vim.g.mapleader = " "
vim.opt.guifont = "Nerd Font Mono:h9"