return {
	'nvimtools/none-ls.nvim',
	config = function()
		local null_ls = require 'null-ls'
		null_ls.setup {
			sources = {
				-- lua
				null_ls.builtins.formatting.stylua,
				-- c++
				null_ls.builtins.formatting.clang_format ,
			},
		}
	end,
}
