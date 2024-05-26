---@class MySql
local M = {}

-- Build a specific query on Mysql with a given config
---@return string, string, string
function M.BuildMySQLQuery(config, query)
    print("Mysql")

    -- docker run -d \
    -- -e MYSQL_DATABASE=TESTDB \
    -- -e MYSQL_USER=u \
    -- -e MYSQL_PASSWORD=p \
    -- -e MYSQL_ROOT_PASSWORD=p \
    -- -p 3306:3306 mysql:latest

    local image_name = 'mysql'
    local sql_command = "bash -c 'MYSQL_PWD=".. config.password ..
        " mysql" ..
        " -h ".. config.hostname ..
        " -P ".. config.port ..
        " -u ".. config.username ..
        " -D ".. config.database ..
        "'"

    return query, sql_command, image_name
end

-- Build a specific query on Mysql with a given config
function M.ExecuteMySQLQuery(config, query)
    local docker = require('docker')
    docker.DockerExecute(
        M.BuildMySQLQuery(
            config,
            query
        )
    )
end

return M
