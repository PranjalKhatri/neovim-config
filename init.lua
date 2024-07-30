local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Auto-read files when changed outside of Neovim
vim.opt.autoread = true

-- Check for file changes automatically
vim.api.nvim_exec([[
  augroup auto_read
    autocmd!
    autocmd FocusGained,BufEnter * checktime
    autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
  augroup END
]], false)



require("vim-options")
require("lazy").setup("plugins")
