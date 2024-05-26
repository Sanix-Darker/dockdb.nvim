local docker = require('..lua.docker')

---@class MongoDB
local M = {}
M.ENGINE_NAME = "MongoDB"
M.ENGINE_IMAGE = "mongo"
M.ENGINE_CLI = "mongosh"

-- Build a specific query on MongoDB with a given config
function M.BuildMongoDBQuery(sql_config, query)
    print(M.ENGINE_NAME)

    -- docker run -d --rm \
    -- --env-file .env.mongodb \
    -- -p 27017:27017 mongo:latest
    local command = "bash -c 'MYSQL_PWD=".. sql_config.password ..
        " mysql" ..
        " -h ".. sql_config.hostname ..
        " -P ".. sql_config.port ..
        " -u ".. sql_config.username ..
        " -D ".. sql_config.database ..
        "'"

    return query, command, M.ENGINE_IMAGE
end

-- Execute a specific query on MongoDB with a given config
function M.ExecuteMongoDBQuery(config, query)
    docker.DockerExecute(
        M.BuildMongoDBQuery(
            config,
            query
        )
    )
end

return M
