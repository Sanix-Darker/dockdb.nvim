local docker = require('..lua.docker')

---@class MySql
local M = {}
M.ENGINE_NAME = "Mysql"
M.ENGINE_IMAGE = "mysql"
M.ENGINE_CLI = "mysql"

-- Build a specific query on Mysql with a given config
---@return string, string, string
function M.BuildMySQLQuery(config, query)
    print(M.ENGINE_NAME)

    -- docker run -d \
    -- -e MYSQL_DATABASE=TESTDB \
    -- -e MYSQL_USER=u \
    -- -e MYSQL_PASSWORD=p \
    -- -e MYSQL_ROOT_PASSWORD=p \
    -- -p 3306:3306 mysql:latest

    local command = "bash -c 'MYSQL_PWD=".. config.password ..
        " " .. M.ENGINE_CLI ..
        " -h ".. config.hostname ..
        " -P ".. config.port ..
        " -u ".. config.username ..
        " -D ".. config.database ..
        "'"

    return query, command, M.ENGINE_IMAGE
end

-- Build a specific query on Mysql with a given config
function M.ExecuteMySQLQuery(config, query)
    if config == nil then
        error("ERROR: No '".. M.ENGINE_NAME .."' config options found !")
    end

    docker.DockerExecute(
        M.BuildMySQLQuery(
            config,
            query
        )
    )
end

return M
