---@class Oracle
local M = {}

-- Build a specific query on Oracle with a given config
function M.BuildOracleDBQuery(config, query)
    print("Oracle")

    -- docker run -d -p 1521:1521 \
    -- -e ORACLE_PASSWORD=p \
    -- -e ORACLE_DATABASE=TESTDB \
    -- -e APP_USER=u \
    -- -e APP_USER_PASSWORD=p \
    -- gvenzl/oracle-xe

    local image_name = 'gvenzl/oracle-xe'
    local sql_command = "bash -c '" ..
        "sqlplus" ..
        " ".. config.username .. -- 'system' should be set here as default
        "/".. config.password ..
        "@//".. config.hostname ..
        ":".. config.port ..
        "/".. config.oracle_sid ..
        "'"

    return query, sql_command, image_name
end

-- Execute a specific query on Oracle with a given config
function M.ExecuteOracleDBQuery(config, query)
    local docker = require('docker')
    docker.DockerExecute(
        M.BuildOracleDBQuery(
            config,
            query
        )
    )
end

return M
