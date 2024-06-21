return {
	-- :Format - format the code using LSP built-in
	{
		'Format',
		function()
			vim.lsp.buf.format()
		end,
		{
			desc = 'Format current buffer with LSP',
		},
	},

	-- :Dl - Diagnostic list [in quickfix], all severity
	{
		'Dl',
		function()
			vim.diagnostic.setqflist()
		end,
		{
			desc = 'Find diagnostic messages of current buffer and put in the quickfix list'
		},
	},

	-- :De - Diagnostic list [in quickfix], error severity
	{
		'De',
		function()
			vim.diagnostic.setqflist(
				{
					severity = 1,
				}
			)
		end,
		{
			desc = 'Find diagnostic messages of current buffer and put in the quickfix list'
		},
	}
}
