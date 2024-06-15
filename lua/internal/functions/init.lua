local M = {}


M.subscript_table = {
	['h'] = '󰛢',
	[','] = ',',
	['('] = '₍',
	[')'] = '₎',
	['0'] = '₀',
	['1'] = '₁',
	['2'] = '₂',
	['3'] = '₃',
	['4'] = '₄',
	['5'] = '₅',
	['6'] = '₆',
	['7'] = '₇',
	['8'] = '₈',
	['9'] = '₉',
}

---Converts a given text
---To it's subscript equivalent
---Uses a small dictionary, so
---onlay a few characters can be
---converted to subscript.
---@param text string
---@return string, number
M.subscript = function(text)
	return text:gsub(
		'.',
		function(s)
			return M.subscript_table[s] or s
		end
	)
end

return M
