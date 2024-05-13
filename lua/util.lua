function ExecuteWithOpts(key, opts, callback)

    if opts == nil then
        error("No '".. key .."' config opts found !")
    end

    callback(
        opts,
        table.concat(
            vim.fn.getline("'<", "'>"),
            "\n"
        )
    )
end

