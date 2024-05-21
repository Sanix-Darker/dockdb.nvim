-- Engine imports
--
local mysql = require('mysql')
local postgresql = require('postgresql')
local mongodb = require('mongodb')
local mssql = require('mssql')
local mariadb = require('mariadb')
local oracle = require('oracle')

local util = require('util')

---@class DockDb
local M = {}

-- On Mysql execute sql query with the good set of config
function M.RunMySqlQuery()
    util.ExecuteWithOpts(
        "MySql",
        M.opts.mysql,
        mysql.ExecuteMySQLQuery
    )
end

-- On PostgresSql execute sql query with the good set of config
function M.RunPostgresSqlQuery()
    util.ExecuteWithOpts(
        "PostgresSql",
        M.opts.postgresql,
        postgresql.ExecutePostgresSQLQuery
    )
end

-- TODO:
-- On MongoDB execute query with the good set of config
function M.RunMongoDBQuery()
    util.ExecuteWithOpts(
        "MongoDB",
        M.opts.mongodb,
        mongodb.ExecuteMongoDBQuery
    )
end

-- TODO:
-- On MariaDB execute query with the good set of config
function M.RunMariaDBQuery()
    util.ExecuteWithOpts(
        "MariaDB",
        M.opts.mariadb,
        mariadb.ExecuteMariaDBQuery
    )
end

-- TODO:
-- On MSSql execute query with the good set of config
function M.RunMSSqlQuery()
    util.ExecuteWithOpts(
        "MSSql",
        M.opts.mssql,
        mssql.ExecuteMSSqlQuery
    )
end

-- TODO:
-- On Oracle execute query with the good set of config
function M.RunOracleDBQuery()
    util.ExecuteWithOpts(
        "MSSql",
        M.opts.oracle,
        oracle.ExecuteOracleDBQuery
    )
end

-- Setup user settings.
function M.setup(opts)
    local default_opts = opts
    M.opts = vim.tbl_extend("keep", opts, default_opts)
end

return M
