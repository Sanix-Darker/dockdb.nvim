-- Engine imports
local mysql = require('mysql')
local postgresql = require('postgresql')
local mongodb = require('mongodb')
local mssql = require('mssql')
local mariadb = require('mariadb')
local oracle = require('oracle')
local redis = require('redis')
local memcached = require('memcached')

local util = require('util')

---@class DockDb
local M = {}

-- On Mysql execute sql query with the good set of config
function M.RunMySqlQuery()
    util.ExecuteWithOpts(
        M.opts.mysql,
        mysql.ExecuteMySQLQuery
    )
end

-- On PostgresSql execute sql query with the good set of config
function M.RunPostgresSqlQuery()
    util.ExecuteWithOpts(
        M.opts.postgresql,
        postgresql.ExecutePostgresSQLQuery
    )
end

-- On MongoDB execute query with the good set of config
function M.RunMongoQuery()
    util.ExecuteWithOpts(
        M.opts.mongodb,
        mongodb.ExecuteMongoQuery
    )
end

-- On MariaDB execute query with the good set of config
function M.RunMariaQuery()
    util.ExecuteWithOpts(
        M.opts.mariadb,
        mariadb.ExecuteMariaQuery
    )
end

-- TODO:
-- On MSSql execute query with the good set of config
function M.RunMSSqlQuery()
    util.ExecuteWithOpts(
        M.opts.mssql,
        mssql.ExecuteMSSqlQuery
    )
end

-- On Oracle execute query with the good set of config
function M.RunOracleQuery()
    util.ExecuteWithOpts(
        M.opts.oracle,
        oracle.ExecuteOracleQuery
    )
end

-- On Redis execute query with the good set of config
function M.RunRedisQuery()
    util.ExecuteWithOpts(
        M.opts.redis,
        redis.ExecuteRedisQuery
    )
end

-- On Memcached execute query with the good set of config
function M.RunMemcachedQuery()
    util.ExecuteWithOpts(
        M.opts.memcached,
        memcached.ExecuteMemcachedQuery
    )
end

-- Setup user settings.
function M.setup(opts)
    local default_opts = opts
    M.opts = vim.tbl_extend("keep", opts, default_opts)
end

return M
