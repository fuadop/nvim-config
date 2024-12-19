local _mappings = require('internal.mappings.harpoon_keymaps')
local _commands = require('internal.commands.harpoon_commands')

require('harpoon'):setup()

-- create the commands
for _, c in ipairs(_commands) do
	vim.api.nvim_create_user_command(c[1], c[2], c[3])
end

-- create the keymaps
for mode, keymaps in pairs(_mappings) do
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

-- register event handlers [for custom extensions]
require('internal.harpoon.extensions').register_event_handlers()

