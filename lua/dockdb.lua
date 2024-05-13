---@class DckDb
local M = {}

-- On Mysql execute sql query with the good set of config
function M.RunMySqlQuery()
    local default_mysql =  {
        username = 'root',
        password = 'toor',
        database = 'TESTDB',
        hostname = 'localhost',
        port = '3306'
    }

    -- if nil, we set default ones
    if M.opts == nil then
        M.opts = default_mysql
    end

    local selected_text_as_query = table.concat(vim.fn.getline("'<", "'>"), "\n")

    ExecuteMySQLQuery(
        M.opts,
        selected_text_as_query
    )
end

-- On PostgresSql execute sql query with the good set of config
function M.RunPostgresSqlQuery()
    local default_pg =  {
        username = 'postgres',
        password = 'postgres',
        database = 'TESTDB',
        hostname = 'localhost',
        port = '5432'
    }

    -- if nil, we set default ones
    if M.opts == nil then
        M.opts = default_pg
    end

    local selected_text_as_query = table.concat(
        vim.fn.getline("'<", "'>"),
        "\n"
    )

    ExecutePostgresSQLQuery(
        M.opts,
        selected_text_as_query
    )
end

-- TODO:
-- On MongoDB execute query with the good set of config
function M.RunMongoDbQuery()
    local default_mongo = {
        username = 'mongo',
        password = 'mongo',
        database = 'TESTDB',
        hostname = 'localhost',
        port = '5432'
    }

    -- if nil, we set default ones
    if M.opts == nil then
        M.opts = default_mongo
    end

    local selected_text_as_query = table.concat(
        vim.fn.getline("'<", "'>"),
        "\n"
    )

    ExecutePostgresSQLQuery(
        M.opts,
        selected_text_as_query
    )
end

-- Setup user settings.
function M.setup(opts)
    local default_opts = opts
    M.opts = vim.tbl_extend("keep", opts, default_opts)

    -- Define a custom command to execute the MySQL query
    vim.cmd("command! -range DockDbExecuteMongo :lua RunMongoDbQuery()")
    vim.cmd("command! -range DockDbExecuteMySQL :lua RunMySqlQuery()")
    vim.cmd("command! -range DockDbExecutePostgresSQL :lua RunPostgresSqlQuery()")
end

return M
