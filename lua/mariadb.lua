---@class MariaDB
local M = {}

-- Build a specific query on MariaDB with a given config
function M.BuildMariaDBQuery(_, _)
end

-- Execute a specific query on MariaDB with a given config
function M.ExecuteMariaDBQuery(_, _)
    print("MariaDB")

    -- docker run \
    -- -e MYSQL_ROOT_PASSWORD=root \
    -- -d mariadb:latest
    local image_name = 'mariadb'
    local cli = 'mariadb'

    error("NotImplemented :: ".. image_name .. " :: " .. cli)
end

return M
