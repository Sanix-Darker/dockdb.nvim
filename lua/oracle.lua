---@class Oracle
local M = {}

-- Build a specific query on Oracle with a given config
function M.BuildOracleDBQuery(sql_config, sql_query)
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
        " ".. sql_config.username .. -- 'system' should be set here as default
        "/".. sql_config.password ..
        "@//".. sql_config.hostname ..
        ":".. sql_config.port ..
        "/".. sql_config.oracle_sid ..
        "'"

    return sql_query, sql_command, image_name
end

-- Execute a specific query on Oracle with a given config
function M.ExecuteOracleDBQuery(sql_config, sql_query)
    local docker = require('docker')
    docker.DockerExecute(
        M.BuildOracleDBQuery(
            sql_config,
            sql_query
        )
    )
end

return M
