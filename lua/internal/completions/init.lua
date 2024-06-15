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
		['<CR>'] = cmp.mapping.confirm { select = true },

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
		format = lspkind.cmp_format {},
	}
}

require('luasnip.loaders.from_vscode').lazy_load() -- rafamadriz/friendly-snippets

