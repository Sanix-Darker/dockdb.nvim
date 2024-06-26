---@class MariaDB
local M = {}
M.ENGINE_NAME = "MariaDB"
M.ENGINE_IMAGE = "mariadb"
M.ENGINE_CLI = "mariadb"

-- Build a specific query on MariaDB with a given config
function M.BuildMariaQuery(config, query)
    print(M.ENGINE_NAME)

    -- docker run \
    -- -e MYSQL_DATABASE=TESTDB \
    -- -e MYSQL_USER=u \
    -- -e MYSQL_PASSWORD=p \
    -- -e MYSQL_ROOT_PASSWORD=p \
    -- -d mariadb:latest

    local command = "bash -c 'MYSQL_PWD=".. config.password ..
        " " .. M.ENGINE_CLI..
        " -u ".. config.username ..
        " -D ".. config.database ..
        "'"

    return query, command, M.ENGINE_IMAGE
end

-- Execute a specific query on MariaDB with a given config
function M.ExecuteMariaQuery(config, query)
    if config == nil then
        error("ERROR: No '".. M.ENGINE_NAME .."' config options found !")
    end

    require("docker").DockerExecute(
        M.BuildMariaQuery(
            config,
            query
        )
    )
end

return M
