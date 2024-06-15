local K = {}
local harpoon = require('harpoon')

-- NORMAL
K.n = {
	-- <leader>ha - Add current buffer to harpoon list
	-- <leader>hl - Toggle Harpoon list in floting window
	-- <leader>hn - Toggle next buffer in harpoon list
	-- <leader>hp - Toggle previous buffer in harpoon list
	-- <leader>h0 - Toggle the harpoon buffer at position 1

	{
		'<leader>ha',
		function()
			harpoon:list():add()
		end,
		nil,
		'[H]arpoon [A]dd current buffer'
	},

	{
		'<leader>hl',
		function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end,
		nil,
		'[H]arpoon buffers [L]ist'
	},

	{
		'<leader>hn',
		function()
			harpoon:list():next()
		end,
		nil,
		'[H]arpoon Toggle [N]ext'
	},

	{
		'<leader>hp',
		function()
			harpoon:list():prev()
		end,
		nil,
		'[H]arpoon Toggle [P]revious'
	},

	{
		'<leader>h0', -- alias to hs1 [long live the pinky finger]
		function()
			harpoon:list():select(1)
		end,
		nil,
		'[H]arpoon [S]elect buffer@1'
	},
}

-- INSERT
K.i = {}

-- VISUAL
K.v = {}

-- TERMINAL
K.t = {}

-- NORMAL CONT.
-- let's populate <leader>h{1..9}
for _, n in ipairs { 1, 2, 3, 4, 5, 6, 7, 8, 9 } do
	table.insert(
		K.n,
		{
			string.format('<leader>h%d', n),
			function()
				harpoon:list():select(n)
			end,
			nil,
			string.format('[H]arpoon [S]elect buffer@%d', n)
		}
	)
end

return K
