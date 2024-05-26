---@class MsSql
local M = {}
M.ENGINE_NAME = "MSSql"
M.ENGINE_IMAGE = "mcr.microsoft.com/mssql/server"
M.ENGINE_CLI = "sqlcmd"

-- Build a specific query on MsSql with a given config
function M.BuildMSSqlQuery(_, _)
    print(M.ENGINE_NAME)

    -- docker run \
    -- -e "ACCEPT_EULA=Y" \
    -- -e "SA_PASSWORD=YourStrong!Passw0rd" \
    -- -p 1433:1433 \
    -- -d mcr.microsoft.com/mssql/server:latest
end

-- Execute a specific query on MsSql with a given config
function M.ExecuteMSSqlQuery(_, _)
    error("NotImplemented :: ".. M.ENGINE_NAME)
end

return M
