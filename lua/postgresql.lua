local docker = require('..lua.docker')

---@class PostgresSql
local M = {}
M.ENGINE_NAME = "PostgresSql"
M.ENGINE_IMAGE = "postgres"
M.ENGINE_CLI = "psql"

-- Build a given PostgresQuery with a specific config
function M.BuildPostgresSQLQuery(config, query)
    print(M.ENGINE_NAME)

    -- docker run \
    -- -d --rm \
    -- -e POSTGRES_PASSWORD=p \
    -- -e POSTGRES_USER=u \
    -- -e POSTGRES_DB=TESTDB \
    -- -p 5432:5432 postgres:latest
    local command = "bash -c 'PGPASSWORD=".. config.password ..
        " " .. M.ENGINE_CLI ..
        " -h ".. config.hostname ..
        " -p ".. config.port ..
        " -U ".. config.username ..
        " -d ".. config.database ..
        "'"

    return query, command, M.ENGINE_IMAGE
end

-- Execute a given PostgresQuery with a specific config
function M.ExecutePostgresSQLQuery(config, query)
    if config == nil then
        error("ERROR: No '".. M.ENGINE_NAME .."' config options found !")
    end

    docker.DockerExecute(
        M.BuildPostgresSQLQuery(
            config,
            query
        )
    )
end

return M
