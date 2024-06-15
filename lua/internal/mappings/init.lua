local modes = require('internal.mappings.keymaps')

for mode, maps in pairs(modes) do
	for _, m in ipairs(maps) do
		vim.keymap.set(mode, m[1], m[2], m[3])
	end
end

