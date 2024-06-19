local K = {}

-- NORMAL
K.n = {
	{'<leader>rn', vim.lsp.buf.rename, nil, '[R]e[n]ame'},
	{'<leader>ca', vim.lsp.buf.code_action, nil, '[C]ode [A]ction'},
	{'<leader>D', vim.lsp.buf.type_definition, nil, 'Type [D]efinition'},
	{'<leader>wa', vim.lsp.buf.add_workspace_folder, nil, '[W]orkspace [A]dd Folder'},
	{'<leader>wr', vim.lsp.buf.remove_workspace_folder, nil, '[W]orkspace [R]emove Folder'},
	{
		'<leader>wl',
		function()
			print(
				vim.inspect(
					vim.lsp.buf.list_workspace_folders()
				)
			)
		end,
		nil,
		'[W]orkspace [L]ist Folders',
	},

	{'gI', vim.lsp.buf.implementation, nil, '[G]oto [I]mplementation'},
	{'gD', vim.lsp.buf.declaration, nil, '[G]oto [D]eclaration'},

	-- todo: put in a popup window [similar to harpoon]
	{'gR', vim.lsp.buf.references, nil, '[G]oto [R]eferences'},
	-- todo: put in a popup window [similar to harpoon] if more than one
	{'gd', vim.lsp.buf.definition, nil, '[G]oto [D]efinition'},

	{'K', vim.lsp.buf.hover, nil, 'Hover Documentation'},
	{'<C-k>', vim.lsp.buf.signature_help, nil, 'Signature Documentation'},
}

-- INSERT
K.i = {}

-- VISUAL
K.v = {}

-- TERMINAL
K.t = {}

return K
