---@class MariaDB
local M = {}

-- Build a specific query on MariaDB with a given config
function M.BuildMariaDBQuery(config, query)
    print("MariaDB")

    -- docker run \
    -- -e MYSQL_DATABASE=TESTDB \
    -- -e MYSQL_USER=u \
    -- -e MYSQL_PASSWORD=p \
    -- -e MYSQL_ROOT_PASSWORD=p \
    -- -d mariadb:latest

    local image_name = 'mariadb'
    local command = "bash -c 'MYSQL_PWD=".. config.password ..
        " mariadb" ..
        " -h ".. config.hostname ..
        " -P ".. config.port ..
        " -u ".. config.username ..
        " -D ".. config.database ..
        "'"

    return query, command, image_name
end

-- Execute a specific query on MariaDB with a given config
function M.ExecuteMariaDBQuery(config, sql_query)
    local docker = require('docker')
    docker.DockerExecute(
        M.BuildMariaDBQuery(
            config,
            sql_query
        )
    )
end

return M
