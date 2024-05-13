---Return a container id from image name by running 'docker ps ... | head'
---@return string
function GetDockerContainerID(image_name)
    local command="docker ps -q --filter ancestor=".. image_name .." | head -n 1"
    local output = vim.fn.systemlist(command)
    return table.concat(output, "\n")
end

---Execute Docker command With DB query and CLI binded and print on command prompt
function DockerExecute(query, command, image_name)
    -- Replace the placeholder with the selected text
    local to_execute = "echo -ne '" .. query .. "' |\
        docker exec -i ".. GetDockerContainerID(image_name) .. " " .. command
    print(to_execute)

    -- Execute the command and capture the output
    local output = vim.fn.systemlist(to_execute)
    -- Format the output as a single string
    local output_str = table.concat(output, "\n")

    print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
    -- Display the output in the command section
    local success, _ = pcall(function()
        vim.api.nvim_command("echo '" .. vim.fn.escape(output_str, "'") .. "'")
        return true
    end)
    -- in case of error just simple print
    if not success then
        print(output_str)
    end
end
