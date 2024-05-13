---@class DckDb
local M = {}

-- On Mysql execute sql query with the good set of config
function M.RunMySqlQuery()
    local selected_text_as_query = table.concat(vim.fn.getline("'<", "'>"), "\n")

    ExecuteMySQLQuery(
        M.opts,
        selected_text_as_query
    )
end

-- On PostgresSql execute sql query with the good set of config
function M.RunPostgresSqlQuery()
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
end

return M
