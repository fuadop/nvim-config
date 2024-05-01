local utils = require("new-file-template.utils")

local function base_template(relative_path, filename)
  -- get the parent directory
  local pdr = string.gsub(
    vim.fn.expand('%:h'),
    "%s+",
    ""
  )

  -- give me the last boy
  if string.find(pdr, "/") then
    pdr = table.remove(
      utils.split(pdr, "/")
    )
  end

  -- we need to figure out when it would be main package
  -- let's assume any directory with go.mod will be main package
  -- vim.fn.findfil
  local _cmd = 'test -f '
    .. vim.fn.expand('%:p:h')
    .. '/go.mod'

  -- make the bad boy main
  if os.execute(_cmd) == 0 then
    pdr = 'main'
  end

  return [[
package ]] .. pdr .. [[
]]
end

--- @param opts table
---   A table containing the following fields:
---   - `full_path` (string): The full path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `relative_path` (string): The relative path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `filename` (string): The filename of the new file, e.g., "init.lua".
return function(opts)
  local template = {
    { pattern = ".*", content = base_template },
  }

  return utils.find_entry(template, opts)
end
