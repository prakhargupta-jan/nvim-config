return {
		-- Neon colorscheme
		-- :help neon-configuration for more options
		"rafamadriz/neon",
		config = function()
			vim.g.neon_style = "dark"
			vim.g.neon_italic_keyword = true
			vim.g.neon_italic_function = true
			vim.g.neon_italic_italic_comment = true
			-- The next line is for transparent background
			-- vim.g.neon_transparent = true
			vim.g.neon_bold = true
			vim.cmd("colorscheme neon")

		end
	}
