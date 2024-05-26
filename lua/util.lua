---@class Util
local M = {}

function M.ExecuteWithOpts(opts, callback)
    callback(
        opts,
        table.concat(
            vim.fn.getline("'<", "'>"),
            " " -- "\n"
        )
    )
end

function M.EscapeQuotes(strr)
    -- FIXME: use a proper regex for this in the future
    return strr
end

return M
