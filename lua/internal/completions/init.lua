local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

cmp.setup {
	expand = function(args)
		luasnip.lsp_expand(args.body)
	end,

	sources = cmp.config.sources(
		-- first priority sources
		{
			{ name = 'nvim_lsp' }, -- from lsp suggestions
			{ name = 'luasnip' }, -- from luasnip suggestions
			{ name = 'nvim_lsp_signature_help' }, -- from lsp signature suggestions
		},
		-- second priority sources
		{
			{ name = 'path' }, -- suggestions from system file paths
			{ name = 'buffer' }, -- suggestions from texts in current buffer
		}
	),

	mapping = cmp.mapping.preset.insert {
		-- Ctrl+E to close auto-complete menu
		['<C-e>'] = cmp.mapping.abort(),
		-- Ctrl+Space to open auto-complete menu
		['<C-Space>'] = cmp.mapping.complete(),

		-- Enter to accept
		-- Ignore func. arguments completions
		['<CR>'] = cmp.mapping(
			function(fallback)
				if cmp.visible() then
					local entry = cmp.get_selected_entry()
					if entry ~= nil then
						if entry.source then
							if entry.source.name ~= 'nvim_lsp_signature_help' then
								cmp.confirm { select = true }
							else
								cmp.abort()
								fallback()
							end
						else
							cmp.confirm { select = true }
						end
					else
						fallback()
					end
				else
					fallback()
				end
			end
		),

		-- Tap/Shift-Tab for selection[up/down]
		['<Tab>'] = cmp.mapping(
			function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.locally_jumpable(1) then
					luasnip.jump(1)
				else
					fallback()
				end
			end,
			{ 'i', 's' }
		),

		['<S-Tab>'] = cmp.mapping(
			function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.locally_jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end,
			{ 'i', 's' }
		),
	},

	formatting = {
		format = lspkind.cmp_format {
			mode = 'symbol_text',
			menu = {
				path = '[Path]',
				buffer = '[Buffer]',
				luasnip = '[LuaSnip]',
				nvim_lsp = '[LSP]',
				nvim_lua = '[Lua]',
				latex_symbols = '[Latex]',
			},
		},
	},

	experimental = {
		ghost_text = true,
	},
}

require('luasnip.loaders.from_vscode').lazy_load() -- rafamadriz/friendly-snippets

