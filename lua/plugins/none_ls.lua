return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
  },
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        -- lua
        null_ls.builtins.formatting.stylua,
        -- c++
        null_ls.builtins.formatting.clang_format,
        -- ts/js
        null_ls.builtins.formatting.prettier,
		require("none-ls.diagnostics.eslint_d"),
		require("none-ls.code_actions.eslint_d"),
      },
    }
  end,
}
