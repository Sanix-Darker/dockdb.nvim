local docker = require('..lua.docker')

---@class Redis
local M = {}
M.ENGINE_NAME = "Redis"
M.ENGINE_IMAGE = "redis"
M.ENGINE_CLI = "redis-cli"

-- Build a specific query on Redis with a given config
---@return string, string, string
function M.BuildRedisQuery(config, query)
    print(M.ENGINE_NAME)

    -- docker run -d \
    -- -e REDIS_PASSWORD=p \
    -- -p 6479:6479 redis:latest

    local command = "bash -c 'REDIS_PASSWORD="..
        config.password..
        " ".. M.ENGINE_CLI ..
    "'"

    return query, command, M.ENGINE_IMAGE
end

-- Build a specific query on Redis with a given config
function M.ExecuteRedisQuery(config, query)
    if config == nil then
        error("ERROR: No '".. M.ENGINE_NAME .."' config options found !")
    end

    docker.DockerExecute(
        M.BuildRedisQuery(
            config,
            query
        )
    )
end

return M
