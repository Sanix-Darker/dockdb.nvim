---@class MariaDB
local M = {}

-- Build a specific query on MariaDB with a given config
function M.BuildMariaDBQuery(sql_config, sql_query)
    print("MariaDB")

    -- docker run \
    -- -e MYSQL_DATABASE=TESTDB \
    -- -e MYSQL_USER=u \
    -- -e MYSQL_PASSWORD=p \
    -- -e MYSQL_ROOT_PASSWORD=p \
    -- -d mariadb:latest

    local image_name = 'mariadb'
    local sql_command = "bash -c 'MYSQL_PWD=".. sql_config.password ..
        " mariadb" ..
        " -h ".. sql_config.hostname ..
        " -P ".. sql_config.port ..
        " -u ".. sql_config.username ..
        " -D ".. sql_config.database ..
        "'"

    return sql_query, sql_command, image_name
end

-- Execute a specific query on MariaDB with a given config
function M.ExecuteMariaDBQuery(sql_config, sql_query)
    local docker = require('docker')
    docker.DockerExecute(
        M.BuildMariaDBQuery(
            sql_config,
            sql_query
        )
    )
end

return M
