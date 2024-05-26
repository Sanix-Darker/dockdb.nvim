---@class MongoDB
local M = {}
M.ENGINE_NAME = "MongoDB"
M.ENGINE_IMAGE = "mongo"
M.ENGINE_CLI = "mongosh"

-- Build a specific query on MongoDB with a given config
function M.BuildMongoQuery(config, query)
    print(M.ENGINE_NAME)

    -- docker run -d --rm \
    -- --env-file .env.mongodb \
    -- -p 27017:27017 mongo:latest
    local command = "bash -c '"..
        M.ENGINE_CLI ..
        " -u ".. config.username ..
        " -p ".. config.password ..
        "'"

    return query, command, M.ENGINE_IMAGE
end

-- Execute a specific query on MongoDB with a given config
function M.ExecuteMongoQuery(config, query)
    require("docker").DockerExecute(
        M.BuildMongoQuery(
            config,
            query
        )
    )
end

return M
