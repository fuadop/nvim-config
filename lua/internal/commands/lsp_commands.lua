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
}
