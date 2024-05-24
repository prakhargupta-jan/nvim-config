-- lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

plugins = {
	{
-- NVIM Tree
		"nvim-tree/nvim-tree.lua",
		keys = {
			{ "<leader>e", "<cmd>NvimTreeToggle<CR>"},
		},
		config = function()
			require("nvim-tree").setup({
  				sort = {
				    sorter = "case_sensitive",
  				},
  				view = {
    				width = 30,
  				},
  				renderer = {
    				group_empty = true,
  				},
  				filters = {
    				dotfiles = true,
  				},
			})
		end
	}
}

require("lazy").setup(plugins, opts)
