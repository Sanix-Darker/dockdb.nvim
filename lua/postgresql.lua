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

    -- NOTE: CURSED DRAGONS HERE lol,
    -- FIXME: here am always considering that " '" is the starting quote
    -- and "'" is the end quote
    -- replacing first " '" with XZdd+- to prevent the second "'" to be overriden
    -- then re-replace again
    --
    -- All this to have 'ito' --> '\'ito\''
    -- the regex version in lua was not matching perfectly, will fix that later.
    local tmp_replacer = "__XZdd__"
    local formated_sql_query = string.gsub(
        string.gsub(
            string.gsub(
                sql_query,
                " '",
                " "..tmp_replacer.."\\"..tmp_replacer..""
            ),
            "'",
            "\\''"
        ),
        tmp_replacer,
        "'"
    )
    return formated_sql_query, sql_command, image_name
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
