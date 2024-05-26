---@class Docker
local M = {}

---Return a container id from image name by running 'docker ps ... | head'
---@return string
function M.GetDockerContainerID(image_name)
    local command="docker ps -q --filter ancestor=".. image_name .." | head -n 1"
    local output = vim.fn.systemlist(command)
    return table.concat(output, "\n")
end

---Execute Docker command With DB query and CLI binded and print on command prompt
function M.DockerExecute(query, command, image_name)
    -- TODO: inject in the stdin
    -- >>> docker exec .... bash/mysql (SELECT...)
    -- Replace the placeholder with the selected text
    local to_execute = "echo -ne '" .. query .. "' | docker exec -i ".. M.GetDockerContainerID(image_name) .. " " .. command

    print("- - - - - - - - - - - - - - - - - - - -")
    vim.api.nvim_command("!"..to_execute)
end

return M
