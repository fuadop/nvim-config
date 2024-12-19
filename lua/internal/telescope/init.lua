local M = {}
local T = require('telescope')

local mappings = require('internal.mappings.telescope_keymaps')

M.setup = function(opts)
	T.setup(opts)
	T.load_extension('fzf')

	for mode, keymaps in pairs(mappings) do
		for _, k in ipairs(keymaps) do
			local _opts = {}

			-- has extra opts?
			if k[3] then
				_opts = vim.tbl_deep_extend('force', _opts, k[3])
			end

			-- has description?
			if k[4] then
				_opts.desc = k[4]
			end

			vim.keymap.set(
				mode,
				k[1],
				k[2],
				_opts
			)
		end
	end
end

return M
