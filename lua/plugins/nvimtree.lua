return {
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
    				width = 40,
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
