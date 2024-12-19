require('internal.variables') -- must come before all keymappings & plugins
require('internal.options')
require('internal.colorscheme')
require('internal.mappings')
require('internal.commands')
require('internal.plugins') -- must come before LSP & other dependants

-- lazy loaded modules via lazy.nvim
-- require('internal.lsp')
-- require('internal.harpoon')
-- require('internal.treesitter')
-- require('internal.completions')

