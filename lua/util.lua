---@class Util
local M = {}

function M.ExecuteWithOpts(key, opts, callback)
    if opts == nil then
        error("ERROR: No '".. key .."' config options found !")
    end

    callback(
        opts,
        table.concat(
            vim.fn.getline("'<", "'>"),
            " " -- "\n"
        )
    )
end

function M.EscapeQuotes(strr)
    -- NOTE: CURSED DRAGONS HERE lol,
    -- FIXME: here am always considering that " '" is the starting quote
    -- and "'" is the end quote
    -- replacing first " '" with XZdd+- to prevent the second "'" to be overriden
    -- then re-replace again
    --
    -- All this to have 'ito' --> '\'ito\''
    -- the regex version in lua was not matching perfectly, will fix that later.
    local tmp_replacer = "__XZdd__"
    local formated_sql_query = string.gsub(
        string.gsub(
            string.gsub(
                strr,
                " '",
                " "..tmp_replacer.."\\"..tmp_replacer..""
            ),
            "'",
            "\\''"
        ),
        tmp_replacer,
        "'"
    )
    return formated_sql_query
end

return M
