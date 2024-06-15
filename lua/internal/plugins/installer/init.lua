local M = {}

M.setup = function()
	local utils = require('internal.plugins.installer.utils')

	utils.install_package_manager()
	utils.install_editor_packages()
end

return M
