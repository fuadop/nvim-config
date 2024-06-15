local M = {}

local harpoon = require('harpoon')
local FilePath = require('plenary.path')

M.mini_tabline_format = function(buf_id, label)
	-- suffix "󰛢₀ " | ""
	-- "<leader>h{0-9}" is my harpoon key mappings
	local _s = ''

	-- harpon value representation
	local _hv = FilePath
		:new(vim.api.nvim_buf_get_name(buf_id))
		:make_relative((vim.uv or vim.loop).cwd())

	-- harpon list index for value
	local _, _hi = harpoon:list():get_by_value(_hv)

	-- is the buffer a part of the harpoon list?
	if _hi then
		_s = string.format('h%d ', _hi)

		-- let's convert _s to fancy subscript
		-- some inspirations are in the akinsho/bufferline repo
		_s = require('internal.functions').subscript(_s)
	end

	return string.format(' %d: [%s] %s', buf_id, label, _s)
end

M.mini_tabline_force_reload = function(_)
	vim.o.tabline = '%!v:lua.MiniTabline.make_tabline_string()'
end

---Trigger actions on harpoon events
M.register_event_handlers = function()
	harpoon:extend{
		ADD = M.mini_tabline_force_reload,
		-- REMOVE = M.mini_tabline_force_reload,
		-- REORDER = M.mini_tabline_force_reload,
		-- POSITION_UPDATED = M.mini_tabline_force_reload,
	}
end

return M
