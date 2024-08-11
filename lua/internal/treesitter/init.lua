local _utils = require('internal.treesitter.utils')

require('nvim-treesitter.configs').setup {
	auto_install = false,

	ensure_installed = vim.tbl_deep_extend(
		'force',
		_utils.mandatory_parsers,
		{
			'go',
			'asm',
			'tsx',
			'rust',
			'python',
			'javascript',
			'typescript',
		}
	),

	indent = { enable = true },

	highlight = {
		enable = true,
		ignore = { 'vimdoc' },
	},

	-- some magical visual mode
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<CR>',
			node_incremental = '<Tab>',
			node_decremental = '<S-Tab>',
			scope_incremental = '<CR>',
		},
	},

	textobjects = {
		select = {
			enable = true,
			lookahead = true,

			keymaps = {
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
				['if'] = '@function.inner',
				['af'] = '@function.outer',
				['aa'] = '@parameter.outer',
				['ia'] = '@parameter.inner',
			},

			selection_modes = {
				-- I prefer linewise ('V')
				-- over the default charwise ('v')
				-- For the wrap arounds (va[x])
				['@class.outer'] = 'V',
				['@function.outer'] = 'V',
			},
		},

		-- keep flying
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@function.outer', -- personal preference :|
			},
			goto_next_end = {
				[']M'] = '@function.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@function.outer', -- personal preference :|
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
			},
		},

		swap = {
			enable = true,
			swap_next = {
				['<leader>a'] = '@parameter.inner',
			},
			swap_previous = {
				['<leader>A'] = '@parameter.inner',
			},
		},
	},
}

