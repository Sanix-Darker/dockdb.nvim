---@class Oracle
local M = {}

-- Build a specific query on Oracle with a given config
function M.BuildOracleDBQuery(_, _)
end

-- Execute a specific query on Oracle with a given config
function M.ExecuteOracleDBQuery(_, _)
    print("Oracle")

    -- docker run -d \
    --   -p 1521:1521 -p 5500:5500 \
    --   -e ORACLE_SID=ORCLCDB \
    --   -e ORACLE_PDB=ORCLPDB1 \
    --   -e ORACLE_PWD=your_password \
    --   oracle/database:latest
    local image_name = 'oracle/database'
    local cli = 'sqlplus'

    error("NotImplemented :: ".. image_name .. " :: " .. cli)
end

return M
