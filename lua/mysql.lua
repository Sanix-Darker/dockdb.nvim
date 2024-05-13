---@class MySql
local M = {}

-- Build a specific query on Mysql with a given config
---@return string, string, string
function M.BuildMySQLQuery(sql_config, sql_query)
    print("Mysql")

    local image_name = 'mysql'
    local sql_command = 'mysql' ..
        " -h ".. sql_config.hostname ..
        " -P ".. sql_config.port ..
        " -u ".. sql_config.username ..
        " -p".. sql_config.password ..
        " -D ".. sql_config.database

    return sql_query, sql_command, image_name
end

-- Build a specific query on Mysql with a given config
function M.ExecuteMySQLQuery(sql_config, sql_query)
    local docker = require('docker')
    docker.DockerExecute(
        M.BuildMySQLQuery(sql_config, sql_query)
    )
end

return M
