---@class MsSql
local M = {}

-- Build a specific query on MsSql with a given config
function M.BuildMSSqlQuery(sql_config, sql_query)
    print("MSSql")

    -- docker run \
    -- -e "ACCEPT_EULA=Y" \
    -- -e "SA_PASSWORD=YourStrong!Passw0rd" \
    -- -p 1433:1433 \
    -- -d mcr.microsoft.com/mssql/server:latest
    --
    -- sqlcmd -S localhost -U sa -P Yukon900

    local image_name = 'mcr.microsoft.com/mssql/server'
    local sql_command = "bash -c 'ACCEPT_EULA=Y SA_PASSWORD=".. sql_config.password ..
        " sqlcmd" ..
        " -S ".. sql_config.hostname ..
        " -U ".. sql_config.username ..
        "'"

    return sql_query, sql_command, image_name
end

-- Execute a specific query on MsSql with a given config
function M.ExecuteMSSqlQuery(sql_config, sql_query)
    local docker = require('docker')
    docker.DockerExecute(
        M.BuildMSSqlQuery(
            sql_config,
            sql_query
        )
    )
end

return M
