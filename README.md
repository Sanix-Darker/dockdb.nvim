# Dockdb.nvim

> This plugin is on *DEVELOPMENT MODE*, expect bugs and *BREAKING CHANGES* if using it for now.

## WHY

While working with `SQL`, i wanted to bind my nvim flow with the way i run and test queries.

However, i wanted something extremly simple and light,
with no 'third-party' lib/cli to install, so that on a fresh new server this should be working fine; so i made *dockdb.nvim* that run the visual selected query
to an 'already' running `DataBase Container`.

## REQUIREMENTS

- docker

## FEATURES

- [x] Query Mysql.
- [x] Query PostgreSql.
- [ ] Query MongoDB (comming soon).
- [ ] Query MSsql.
- [ ] Query Redis.
- [ ] Query MemCached.

## PROS

- Fast simple and light.
- No lua or third-party dependencies.

## CONS

- There is no such `session` here, it's a **ONE QUERY HIT**, like a command you run inside a container, from outside, get the output and exit.
- Ideal only for local development.

## HOW DOES IT WORK

The simple idea behind this plugin is to:
- build a query and the command line associated to the target database.
- run the final command query and get output

## HOW TO INSTALL

- Using Packer :
    ```lua
    use 'Sanix-Darker/dockdb.nvim'
    ```

- Using Vim-plug :
    ```
    Plug 'Sanix-Darker/dockdb.nvim'
    ```

    Then in your `init.lua` file you can just run :

    ```lua
    require('dockdb.nvim').setup({
        -- mandatory
        -- your config should be explicitelly provided
    })
    ```

- Using Lazy.nvim :

    ```lua
    require('dockdb').setup()
    ```
    or

    ```lua
    return {
      {
        "Sanix-Darker/dockdb.nvim",
        config = true,
        cmd = { "ExecuteMySQLQuery" },  -- optional, make the plugin loads at cmd executed
      },
    }
    ```

## HOW TO USE

- Select a bunch of lines (your query).
- Execute depending on the Backend and get output in Command Line section.

## COMMANDS

- `DockDbExecuteMongo` Execute the visual selected lines on the first found running mysql container.
- `DockDbExecuteMySQL` Execute the visual selected lines on the first found running mysql container.
- `DockDbExecutePostgresSQL` Execute the visual selected lines on the first found running postgresql container.


## SETUP OPTIONS

Options values are extremly flexible depending on the database you're using,
for example :
```lua
local pg_opts = {
    username = 'postgres',
    password = 'postgres',
    database = 'TESTDB',
    hostname = 'localhost',
    port = '5432'
}
-- or
local redis_opts = {
    port = '6379',
    bind = '127.0.0.1',
    database = 0,
    requirepass = "your_password",
}
-- ... and so on
-- then forward it to dockdb
-- and you're all set
require("dockdb.nvim").setup(opts)
```

## NOTE

If you have some ideas on how to upgrade this plugin i would be happy to read your issues, suggestions, Pull Requests.
But for now i will keep it simple since it does what i want it to do for now.

## AUTHOR

[sanix-darker](https://github.com/sanix-darker)
