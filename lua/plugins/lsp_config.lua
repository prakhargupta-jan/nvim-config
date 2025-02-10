return {
	{
		'williamboman/mason.nvim',
		config = function()
			require('mason').setup {}
		end,
	},
	{
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require('mason-lspconfig').setup {
				ensure_installed = { 'lua_ls', 'clangd', 'ts_ls', 'rust_analyzer', 'gopls' },
			}
		end,
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			local lspconfig = require 'lspconfig'
			-- lua
			lspconfig.lua_ls.setup {}
			-- c/c++
			lspconfig.clangd.setup {}
			-- ts/js
			lspconfig.ts_ls.setup {}
			-- rust
			lspconfig.rust_analyzer.setup {
				settings = {
					['rust-analyzer'] = {
						diagnostics = {
							enable = true
						}
					}
				}
			}
			-- go
			lspconfig.gopls.setup {}
			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(ev)
					local opts = { buffer = ev.buf }
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
					vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
					vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
					vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
					vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
					vim.keymap.set('n', '<A-F>', function()
						vim.lsp.buf.format { async = true }
					end, opts)
				end,
			})
			local servers = { 'ts_ls', 'lua_ls', 'clangd', 'gopls', 'rust_analyzer' }
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			for _, server in ipairs(servers) do
				lspconfig[server].setup {
					capabilities = capabilities,
				}
			end
		end,
	},
}
