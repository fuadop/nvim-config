local M = {}

M.groups = {
	highlight = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
	go_format_on_save = vim.api.nvim_create_augroup('GoFormatOnSave', { clear = true }),
}

M.auto_cmds = {
	{
		event = 'TextYankPost',
		options = {
			group = M.groups.highlight,
			pattern = '*',
			callback = function()
				vim.highlight.on_yank()
			end,
		},
	},
	{
		event = 'BufWritePost',
		options = {
			group = M.groups.go_format_on_save,
			pattern = '*.go',
			callback = function()
				vim.lsp.buf.format()
				vim.cmd('write! %')
			end,
		},
	}
}

M.setup = function()
	for _, auto_cmd in ipairs(M.auto_cmds) do
		vim.api.nvim_create_autocmd(
			auto_cmd.event,
			auto_cmd.options
		)
	end
end

return M
