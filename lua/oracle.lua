---@class Oracle
local M = {}
M.ENGINE_NAME = "Oracle"
M.ENGINE_IMAGE = "gvenzl/oracle-xe"
M.ENGINE_CLI = "sqlplus"

-- Build a specific query on Oracle with a given config
function M.BuildOracleQuery(config, query)
    print(M.ENGINE_NAME)

    -- docker run -d -p 1521:1521 \
    -- -e ORACLE_PASSWORD=p \
    -- -e ORACLE_DATABASE=TESTDB \
    -- -e APP_USER=u \
    -- -e APP_USER_PASSWORD=p \
    -- gvenzl/oracle-xe

    local command = "bash -c '" ..
        M.ENGINE_CLI ..
        " ".. config.username .. -- 'system' should be set here as default
        "/".. config.password ..
        "@//".. config.hostname ..
        ":".. config.port ..
        "/".. config.oracle_sid ..
        "'"

    return query, command, M.ENGINE_IMAGE
end

-- Execute a specific query on Oracle with a given config
function M.ExecuteOracleQuery(config, query)
    if config == nil then
        error("ERROR: No '".. M.ENGINE_NAME .."' config options found !")
    end

    require("docker").DockerExecute(
        M.BuildOracleQuery(
            config,
            query
        )
    )
end

return M
