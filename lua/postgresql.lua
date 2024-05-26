---@class PostgresSql
local M = {}

-- Build a given PostgresQuery with a specific config
function M.BuildPostgresSQLQuery(config, query)
    print("Psql")

    -- docker run \
    -- -d --rm \
    -- -e POSTGRES_PASSWORD=p \
    -- -e POSTGRES_USER=u \
    -- -e POSTGRES_DB=TESTDB \
    -- -p 5432:5432 postgres:latest
    local image_name = 'postgres'
    local sql_command = "bash -c 'PGPASSWORD=".. config.password ..
        " psql" ..
        " -h ".. config.hostname ..
        " -p ".. config.port ..
        " -U ".. config.username ..
        " -d ".. config.database ..
        "'"

    return query, sql_command, image_name
end

-- Execute a given PostgresQuery with a specific config
function M.ExecutePostgresSQLQuery(config, query)
    local docker = require('docker')
    docker.DockerExecute(
        M.BuildPostgresSQLQuery(
            config,
            query
        )
    )
end

return M
