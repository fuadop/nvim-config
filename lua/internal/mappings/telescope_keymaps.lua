local K = {}
local builtin = require('telescope.builtin')

-- NORMAL
K.n = {
	{'<leader>ff', builtin.find_files, nil, 'Telescope find files'},
	{'<leader>fd', builtin.diagnostics, nil, 'Telescope diagnostics'},
	{'<leader>fs', builtin.spell_suggest, nil, 'Telescope spell suggest'},
	{'<leader><leader>', builtin.buffers, nil, 'Telescope buffers'},
}

-- INSERT
K.i = {}

-- VISUAL
K.v = {}

-- TERMINAL
K.t = {}

return K
