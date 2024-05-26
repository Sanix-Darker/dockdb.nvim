---@class MongoDB
local M = {}

-- Build a specific query on MongoDB with a given config
function M.BuildMongoDBQuery(_, _)
    print("MongoDB")

    -- local image_name = 'mongodb'
    -- local cli = 'mongod'

    local image_name = 'mongo'
    local command = "bash -c 'MYSQL_PWD=".. sql_config.password ..
        " mysql" ..
        " -h ".. sql_config.hostname ..
        " -P ".. sql_config.port ..
        " -u ".. sql_config.username ..
        " -D ".. sql_config.database ..
        "'"

    return query, command, image_name
end

-- Execute a specific query on MongoDB with a given config
function M.ExecuteMongoDBQuery(config, query)
    local docker = require('docker')
    docker.DockerExecute(
        M.BuildMongoDBQuery(
            config,
            query
        )
    )
end

return M
