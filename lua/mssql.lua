---@class MsSql
local M = {}

-- Build a specific query on MsSql with a given config
function M.BuildMSSqlQuery(_, _)
end

-- Execute a specific query on MsSql with a given config
function M.ExecuteMSSqlQuery(_, _)
    print("MSSql")

    -- docker run \
    -- -e "ACCEPT_EULA=Y" \
    -- -e "SA_PASSWORD=YourStrong!Passw0rd" \
    -- -p 1433:1433 \
    -- -d mcr.microsoft.com/mssql/server:latest
    local image_name = 'mcr.microsoft.com/mssql/server'
    local cli = 'sqlcmd'

    error("NotImplemented :: ".. image_name .. " :: " .. cli)
end

return M
