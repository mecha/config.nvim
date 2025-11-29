---@param paths string[]
local function find_godot_project(paths)
    local cwd = vim.fn.getcwd()
    for _, value in pairs(paths) do
        if vim.uv.fs_stat(cwd .. value .. "project.godot") then
            return true, cwd .. value
        end
    end
    return false, ""
end

local paths_to_check = { "/", "/../" }
local is_godot_project, godot_project_path = find_godot_project(paths_to_check)

local is_server_running = vim.uv.fs_stat(godot_project_path .. "/server.pipe")

if is_godot_project and not is_server_running then
    vim.fn.serverstart(godot_project_path .. "/server.pipe")
end
