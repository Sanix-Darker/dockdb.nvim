---@class MySql
local M = {}

-- Build a specific query on Mysql with a given config
---@return string, string, string
function M.BuildMySQLQuery(sql_config, sql_query)
    print("Mysql")

    -- docker run -d \
    -- -e MYSQL_DATABASE=TESTDB \
    -- -e MYSQL_USER=u \
    -- -e MYSQL_PASSWORD=p \
    -- -e MYSQL_ROOT_PASSWORD=p \
    -- -p 3306:3306 mysql:latest
    local image_name = 'mysql'
    local sql_command = 'mysql' ..
        " -h ".. sql_config.hostname ..
        " -P ".. sql_config.port ..
        " -u ".. sql_config.username ..
        " -p".. sql_config.password ..
        " -D ".. sql_config.database

    return sql_query, sql_command, image_name
end

--Format print the output of the command executed
--FIXME: BETTER format this
function M.FormatOutPut(output_str)
    print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
    print(output_str)
end

-- Build a specific query on Mysql with a given config
function M.ExecuteMySQLQuery(sql_config, sql_query)
    local docker = require('docker')
    local out_str = docker.DockerExecute(
        M.BuildMySQLQuery(
            sql_config,
            sql_query
        )
    )
    M.FormatOutPut(out_str)
end

return M
