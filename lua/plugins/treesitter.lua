return {
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "typescript", "html", "rust", "go", "bash" },
				auto_install = true,
				sync_install = false,
          		highlight = { enable = true },
          		indent = { enable = true },
			})
		end
	}
