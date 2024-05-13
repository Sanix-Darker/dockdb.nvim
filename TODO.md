## TODO

- [ ] Make the config option more versatile depending on the database service running:
    ```
        {
            mysql: {
                username: "...",
                password: "...",
            },
            postgresql: {
                username: "...",
                ...
            },
            ...
        }
    ```
- [ ] Attribute an id to a command run and store that inside a `/tmp/dockdb.nvim/query_1223`
    So that it can be revisit.
- [ ] Manage an history of previous runed queries.
- [ ] Replay previous queries
