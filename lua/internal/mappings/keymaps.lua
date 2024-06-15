local K = {}

-- NORMAL
K.n = {
	-- pane movements
	{'<leader>h', '<C-w>h'},
	{'<leader>j', '<C-w>j'},
	{'<leader>k', '<C-w>k'},
	{'<leader>l', '<C-w>l'},

	-- pane splitting
	{'<leader>"', '<cmd>split<CR>', {silent=true}},
	{'<leader>%', '<cmd>vsplit<CR>', {silent=true}},

	-- diagnostic float
	{'<leader>e', vim.diagnostic.open_float},

	-- indentbreak scenarios
	{'k', "v:count == 0 ? 'gk' : 'k'", {expr=true, silent=true}},
	{'j', "v:count == 0 ? 'gj' : 'j'", {expr=true, silent=true}},

	{'<Space>', '<Nop>', {silent=true}},
	{'<Esc>', '<cmd>nohlsearch<CR>'}
}

-- INSERT
K.i = {
	{'jk', '<Esc>'},
}

-- VISUAL
K.v = {
	{'<Space>', '<Nop>'},
}

-- TERMINAL
K.t = {
	{'jk', '<C-\\><C-n>'},
	{'<Esc>', '<C-\\><C-n>'},
}

return K
