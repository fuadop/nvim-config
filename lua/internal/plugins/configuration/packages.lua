return {
	-- LSP Setup leveraging built-in lsp
	{
		-- The lollypop needed to integrate built-in lsp
		'neovim/nvim-lspconfig',
		event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
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
		config = function ()
			require('internal.lsp')
		end,
	},

	-- text completions [using LSP suggestion & Luasnip for custom snippets]
	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
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
		config = function()
			require('internal.completions')
		end,
	},

	-- Parser magic
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			-- Ability to create keymaps for vaf, daf, etc.
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		build = ':TSUpdate',
		cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
		event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
		config = function()
			require('internal.treesitter')
		end,
	},

	-- Harpoon - buffer management
	{
		'ThePrimeagen/harpoon',
		event = 'VeryLazy',
		branch = 'harpoon2', -- latest and greatest
		dependencies = {
			{ 'nvim-lua/plenary.nvim', lazy = true },
		},
		config = function()
			require('internal.harpoon')
		end,
	},

	-- Minimalist Bufferline - only display list of buffers in tabline
	{
		'echasnovski/mini.tabline',
		event = 'VeryLazy',
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

	-- Minimalist Bracket pair closing
	{
		'echasnovski/mini.pairs',
		event = 'VeryLazy',
		version = '*',
		config = true,
	},

	-- Can I see my indents please?
	{
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		event = { 'BufReadPost', 'BufWritePost', 'BufNewFile', 'VeryLazy' },
		config = true,
	},

	{
		'nvim-telescope/telescope.nvim',
		event = 'VeryLazy',
		branch = '0.1.x',
		dependencies = {
			{ 'nvim-lua/plenary.nvim', lazy = true },
			{ 'nvim-telescope/telescope-fzf-native.nvim', build='make' },
		},
		opts = {
			pickers = {
				buffers = {
					theme = 'dropdown',
				},
				find_files = {
					theme = 'dropdown',
				},
				spell_suggest = {
					theme = 'cursor',
				},
				diagnostics = {
					theme = 'dropdown',
				},
			},
		},
		config = function(_, opts)
			require('internal.telescope').setup(opts)
		end,
	},

}
