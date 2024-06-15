require('mason').setup()

require('mason-lspconfig').setup {
	ensure_installed = {
		'taplo', -- TOML
		'gopls', -- GO
		'lua_ls', -- LUA
		'eslint', -- ESLINT (JS)
		'jsonls', -- JSON
		'yamlls', -- YAML
		'pyright', -- PYTHON
		'tsserver', -- JS/TS
		'rust_analyzer', -- RUST

		-- not so often
		'zk', -- MD
		'html', -- HTML
		'cssls', -- CSS
		'bashls', -- BASH
	},
}

-- setup keymaps here
-- for one or many LSP server(s)
require('mason-lspconfig').setup_handlers {
	function(lsp_server)
		local _settings = {
			['jsonls'] = {
				json = {
					schemas = require('schemastore').json.schemas(), -- b0o/SchemaStore.nvim
					validate = { enable = true },
				},
			},

			['yamlls'] = {
				yaml = {
					schemas = require('schemastore').yaml.schemas(), -- b0o/SchemaStore.nvim
					schemaStore = {
						url = '',
						enable = false,
					},
				},
			},
		}

		require('lspconfig')[lsp_server].setup {
			settings = _settings[lsp_server],

			-- integration with nvim-cmp for completion
			capabilities = require('internal.completions.capabilities').cmp_nvim_lsp_capabilities,

			on_attach = function(_, bufnr)
				-- keymaps time
				local _modes = require('internal.mappings.lsp_keymaps')

				for mode, keymaps in pairs(_modes) do
					for _, k in ipairs(keymaps) do
						local _opts = { buffer = bufnr }

						-- has extra opts?
						if k[3] then
							_opts = vim.tbl_deep_extend('force', _opts, k[3])
						end

						-- has description?
						if k[4] then
							_opts.desc = 'LSP: ' .. k[4]
						end

						vim.keymap.set(
							mode,
							k[1],
							k[2],
							_opts
						)
					end
				end

				-- commands time
				local _commands = require('internal.commands.lsp_commands')
				for _, c in ipairs(_commands) do
					vim.api.nvim_buf_create_user_command(
						bufnr,
						c[1],
						c[2],
						c[3]
					)
				end

			end
		}
	end
}

-- vim\. support in lua
require('lazydev').setup()
