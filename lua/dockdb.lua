-- imports
require('mysql')
require('postgresql')
require('mongodb')

---@class DckDb
local M = {}

-- On Mysql execute sql query with the good set of config
function M.RunMySqlQuery()
    ExecuteMySQLQuery(
        M.opts,
        table.concat(
            vim.fn.getline("'<", "'>"),
            "\n"
        )
    )
end

-- On PostgresSql execute sql query with the good set of config
function M.RunPostgresSqlQuery()
    ExecutePostgresSQLQuery(
        M.opts,
        table.concat(
            vim.fn.getline("'<", "'>"),
            "\n"
        )
    )
end

-- TODO:
-- On MongoDB execute query with the good set of config
function M.RunMongoDbQuery()
    ExecutePostgresSQLQuery(
        M.opts,
        table.concat(
            vim.fn.getline("'<", "'>"),
            "\n"
        )
    )
end

-- Setup user settings.
function M.setup(opts)
    local default_opts = opts
    M.opts = vim.tbl_extend("keep", opts, default_opts)
end

return M
