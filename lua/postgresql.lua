-- Build a given PostgresQuery with a specific config
function BuildPostgresSQLQuery(sql_config, sql_query)
    print("Psql")

    local image_name = 'postgres'
    local sql_command = "bash -c 'PGPASSWORD=".. sql_config.password ..
        " psql" ..
        " -h ".. sql_config.hostname ..
        " -p ".. sql_config.port ..
        " -U ".. sql_config.username ..
        " -d ".. sql_config.database ..
        "'"

    -- NOTE: CURSED DRAGONS HERE lol,
    -- FIXME: here am always considering that " '" is the starting quote
    -- and "'" is the end quote
    -- replacing first " '" with XZdd+- to prevent the second "'" to be overriden
    -- then re-replace again
    --
    -- All this to have 'ito' --> '\'ito\''
    -- the regex version in lua was not matching perfectly, will fix that later.
    local tmp_replacer = "XZdd+-"
    local formated_sql_query = string.gsub(
        string.gsub(
            string.gsub(
                sql_query,
                " '",
                " "..tmp_replacer.."\\"..tmp_replacer..""
            ),
            "'",
            "\\''"
        ),
        tmp_replacer,
        "'"
    )
    return formated_sql_query, sql_command, image_name
end

-- Execute a given PostgresQuery with a specific config
function ExecutePostgresSQLQuery(sql_config, sql_query)
    DockerExecute(
        BuildPostgresSQLQuery(
            sql_config,
            sql_query
        )
    )
end
