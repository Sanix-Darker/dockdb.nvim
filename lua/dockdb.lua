-- engine imports
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
        mysql.ExecuteMySQLQuery,
        M.opts.mysql
    )
end

-- On PostgresSql execute sql query with the good set of config
function M.RunPostgresSqlQuery()
    util.ExecuteWithOpts(
        "PostgresSql",
        postgresql.ExecutePostgresSQLQuery,
        M.opts.postgresql
    )
end

-- TODO:
-- On MongoDB execute query with the good set of config
function M.RunMongoDBQuery()
    util.ExecuteWithOpts(
        "MongoDB",
        mongodb.ExecuteMongoDBQuery,
        M.opts.mongodb
    )
end

-- TODO:
-- On MariaDB execute query with the good set of config
function M.RunMariaDBQuery()
    util.ExecuteWithOpts(
        "MariaDB",
        mariadb.ExecuteMariaDBQuery,
        M.opts.mariadb
    )
end

-- TODO:
-- On MSSql execute query with the good set of config
function M.RunMSSqlQuery()
    util.ExecuteWithOpts(
        "MSSql",
        mssql.ExecuteMSSqlQuery,
        M.opts.mssql
    )
end

-- TODO:
-- On Oracle execute query with the good set of config
function M.RunOracleDBQuery()
    util.ExecuteWithOpts(
        "MSSql",
        oracle.ExecuteOracleDBQuery,
        M.opts.oracle
    )
end

-- Setup user settings.
function M.setup(opts)
    local default_opts = opts
    M.opts = vim.tbl_extend("keep", opts, default_opts)
end

return M
