vim.cmd('colorscheme retrobox')

-- change common highlights
local highlights = require('internal.colorscheme.highlights')

for k, v in pairs(highlights) do
	vim.api.nvim_set_hl(0, k, v)
end

