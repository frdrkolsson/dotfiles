local M = {}

local deno_markers = { 'deno.json', 'deno.jsonc' }
local node_markers = { 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb', 'bun.lock', 'package.json' }

local function find_root(bufnr, markers)
  return vim.fs.root(bufnr, markers)
end

---@param server_type "deno" | "node"
function M.root_filter(server_type)
  return function(bufnr, on_dir)
    local is_deno = find_root(bufnr, deno_markers)
    local is_node = find_root(bufnr, node_markers)

    if server_type == "deno" then
      if is_deno then
        return on_dir(is_deno)
      end
    elseif server_type == "node" then
      if is_node and not is_deno then
        return on_dir(is_node)
      end
    end
  end
end

return M
