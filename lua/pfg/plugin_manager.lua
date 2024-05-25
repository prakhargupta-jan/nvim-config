vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


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
	},
	{
		-- Neon colorscheme
		-- :help neon-configuration for more options
		"rafamadriz/neon",
		config = function()
			vim.g.neon_style = "dark"
			vim.g.neon_italic_keyword = true
			vim.g.neon_italic_function = true
			vim.g.neon_italic_italic_comment = true
			vim.g.neon_transparent = true
			vim.g.neon_bold = true
			vim.cmd("colorscheme neon")

		end
	},
	{
		-- Telescope (Fuzzy Finder)
		-- Read github page throughly

		"nvim-telescope/telescope.nvim",
		dependencies = { 'nvim-lua/plenary.nvim' },
		keys = {
			{ "<leader>e", "<cmd>NvimTreeToggle<CR>"},
		},
		config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

		end
	},
	{
		-- Prime's Harpoon ( https://github.com/ThePrimeagen/harpoon/tree/harpoon2 )
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function() 
			local harpoon = require("harpoon")
			harpoon:setup()
			vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
			vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

			vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
			vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
			vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
			vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

			-- Toggle previous & next buffers stored within Harpoon list
			vim.keymap.set("n", "<C-P>", function() harpoon:list():prev() end)
			vim.keymap.set("n", "<C-N>", function() harpoon:list():next() end)
			local conf = require("telescope.config").values
			local function toggle_telescope(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end

				require("telescope.pickers").new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				}):find()
			end

			vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
				{ desc = "Open harpoon window" })
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "typescript", "html", "rust", "go", "bash" },
				sync_install = false,
          		highlight = { enable = true },
          		indent = { enable = true },
			})
		end
	}

}

require("lazy").setup(plugins, opts)
