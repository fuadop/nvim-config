require('internal.variables') -- must come before all keymappings & plugins
require('internal.options')
require('internal.colorscheme')
require('internal.plugins') -- must come before LSP & other dependants
require('internal.mappings')
require('internal.commands')
require('internal.lsp')
require('internal.completions')
require('internal.treesitter')
require('internal.harpoon')

