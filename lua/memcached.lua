local docker = require('..lua.docker')

---@class Memcached
local M = {}
M.ENGINE_NAME = "Memcached"
M.ENGINE_IMAGE = "memcached"
M.ENGINE_CLI = "telnet"

-- Build a specific query on Memcached with a given config
---@return string, string, string
function M.BuildMemcachedQuery(config, query)
    print(M.ENGINE_NAME)

    -- docker run -d \
    -- -p 6479:6479 memcached:latest

    local command = "bash -c '"..
    M.ENGINE_CLI ..
    " " .. config.hostname ..
    " " .. config.port ..
    "'"

    return query, command, M.ENGINE_IMAGE
end

-- Build a specific query on Memcached with a given config
function M.ExecuteMemcachedQuery(config, query)
    if config == nil then
        error("ERROR: No '".. M.ENGINE_NAME .."' config options found !")
    end

    docker.DockerExecute(
        M.BuildMemcachedQuery(
            config,
            query
        )
    )
end

return M
