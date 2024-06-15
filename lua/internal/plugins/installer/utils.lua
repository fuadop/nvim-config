local M = {}

M.does_path_exist = function(p)
	if (vim.uv or vim.loop).fs_stat(p) then
		return true
	end

	return false
end

M.install_package_manager = function()
	local _srcpath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
	local _installed = M.does_path_exist(_srcpath)

	if _installed == false then
		vim.fn.system(
			{
				'git',
				'clone',
				'--filter=blob:none',
				'https://github.com/folke/lazy.nvim.git',
				'--branch=stable',
				_srcpath,
			}
		)
	end

	vim.opt.rtp:prepend(_srcpath) -- add to runtimepath
end

M.install_editor_packages = function()
	require('lazy').setup(
		require('internal.plugins.configuration.packages'),
		{
			defaults = {
				-- lazy = true,
			},
		}
	)
end

return M
