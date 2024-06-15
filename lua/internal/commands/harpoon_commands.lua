local harpoon = require('harpoon')

local M = {
	-- :Ha - Add current buffer to harpoon list
	-- :Hl - Toggle Harpoon list in floting window
	-- :Hn - Toggle next buffer in harpoon list
	-- :Hp - Toggle previous buffer in harpoon list

	{
		'Ha',
		function()
			harpoon:list():add()
		end,
		{
			desc = '[H]arpoon [A]dd current buffer',
		},
	},

	{
		'Hl',
		function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end,
		{
			desc = '[H]arpoon buffers [L]ist',
		},
	},

	{
		'Hn',
		function()
			harpoon:list():next()
		end,
		{
			desc = '[H]arpoon Toggle [N]ext',
		},
	},

	{
		'Hp',
		function()
			harpoon:list():prev()
		end,
		{
			desc = '[H]arpoon Toggle [P]revious',
		},
	},

	{
		'Hs0', -- alias to hs1 [long live the pinky finger]
		function()
			harpoon:list():select(1)
		end,
		{
			desc = '[H]arpoon [S]elect buffer@1',
		},
	},
}

-- let's populate :Hs{1..9}
for _, n in ipairs { 1, 2, 3, 4, 5, 6, 7, 8, 9 } do
	table.insert(
		M,
		{
			string.format('Hs%d', n),
			function()
				harpoon:list():select(n)
			end,
			{
				desc = string.format('[H]arpoon [S]elect buffer@%d', n)
			},
		}
	)
end

-- say no to conventions :/
-- I whould have loved the commands lowercased

return M
