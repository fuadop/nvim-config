return {
	-- LSP Setup leveraging built-in lsp
	{
		-- The lollypop needed to integrate built-in lsp
		'neovim/nvim-lspconfig',
		dependencies = {
			-- LSP servers manager
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			-- to give support for vim\. global in lua
			{ 'folke/lazydev.nvim', ft = 'lua' },

			-- to show fancy loader above status line
			-- on LSP server $/progress
			{ 'j-hui/fidget.nvim', event = 'LspAttach', opts = {} },

			-- JSON/YAML popular schemas
			{ 'b0o/SchemaStore.nvim', ft = { 'json', 'yaml' } },
		},
	},

	-- text completions [using LSP suggestion & Luasnip for custom snippets]
	{
		'hrsh7th/nvim-cmp',
		event = { 'InsertEnter' },
		dependencies = {
			-- Ricing the completion menu
			'onsails/lspkind.nvim',
			-- LSP suggestion engine
			'hrsh7th/cmp-nvim-lsp',
			-- Luasnip suggestion engine
			'saadparwaiz1/cmp_luasnip',
			-- Buffers suggestion engine
			'hrsh7th/cmp-buffer',
			-- Filepath suggestion engine
			'hrsh7th/cmp-path',
			-- LSP Signature suggestion engine
			'hrsh7th/cmp-nvim-lsp-signature-help',

			-- Luasnip itself
			'L3MON4D3/LuaSnip',
			-- Some beautiful pre-made luasnip snippets
			'rafamadriz/friendly-snippets',
		},
	},

	-- Parser magic
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			-- Ability to create keymaps for vaf, daf, etc.
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		build = ':TSUpdate',
	},

	-- Harpoon - buffer management
	{
		'ThePrimeagen/harpoon',
		branch = 'harpoon2', -- latest and greatest
		dependencies = {
			-- utility package for sweet lua functions
			'nvim-lua/plenary.nvim',
		},
	},

	-- Minimalist Bufferline - only display list of buffers in tabline
	{
		'echasnovski/mini.tabline',
		version = '*',
		dependencies = {
			-- we need harpoon for bespoke format extension
			{ 'ThePrimeagen/harpoon', branch = 'harpoon2' },
		},
		opts = {
			show_icons = false,
			-- extend the tabline to display harpoon index[es]
			format = function(buf_id, label)
				return require('internal.harpoon.extensions').mini_tabline_format(buf_id, label)
			end
		},
		config = true,
	},

	-- Not what I expected sadly, vim snappiness in vim gone when using
	-- The git & diagnostics part of the fancy status line.
	-- {
	-- 	dir = '~/.config/nvim/github/simpleline.nvim',
	-- 	opts = {
	-- 		components = {},
	-- 	},
	-- },

	-- Minimalist Bracket pair closing
	{
		'echasnovski/mini.pairs',
		version = '*',
		config = true,
	},

	-- Can I see my indents please?
	{
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		config = true,
	},

	-- theme theme theme, my biggest problem
	{
		'ellisonleao/gruvbox.nvim',
		priority = 1000,
		opts = {
			italic = {
				folds = true,
				strings = false,
				comments = false,
				emphasis = true,
				operators = false,
			},
		},
		config = function(_, opts)
			require('gruvbox').setup(opts)
			vim.cmd('colorscheme gruvbox')
		end,
	},
}
