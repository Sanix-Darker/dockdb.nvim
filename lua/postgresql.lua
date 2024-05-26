---@class PostgresSql
local M = {}

-- Build a given PostgresQuery with a specific config
function M.BuildPostgresSQLQuery(sql_config, sql_query)
    print("Psql")

    -- docker run \
    -- -d --rm \
    -- -e POSTGRES_PASSWORD=p \
    -- -e POSTGRES_USER=u \
    -- -e POSTGRES_DB=TESTDB \
    -- -p 5432:5432 postgres:latest
    local image_name = 'postgres'
    local sql_command = "bash -c 'PGPASSWORD=".. sql_config.password ..
        " psql" ..
        " -h ".. sql_config.hostname ..
        " -p ".. sql_config.port ..
        " -U ".. sql_config.username ..
        " -d ".. sql_config.database ..
        "'"

    return sql_query, sql_command, image_name
end

-- Execute a given PostgresQuery with a specific config
function M.ExecutePostgresSQLQuery(sql_config, sql_query)
    local docker = require('docker')
    docker.DockerExecute(
        M.BuildPostgresSQLQuery(
            sql_config,
            sql_query
        )
    )
end

return M
