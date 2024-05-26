# Dockdb.nvim

> This plugin is on huge *DEVELOPMENT MODE*, expect bugs and *BREAKING CHANGES* if using it for now.


https://github.com/Sanix-Darker/dockdb.nvim/assets/22576758/08160855-4ba4-47de-a9ba-ac5d218a92db


## WHY

While working with `SQL`, i wanted to bind my nvim flow with the way i run and test queries.

However, i wanted something extremly simple and light,
with no 'third-party' lib/cli to install, so that on a fresh new server this should be working fine; so i made *dockdb.nvim* that run the visual selected query
to an 'already' running `DataBase Container`.

## REQUIREMENTS

- docker
- nvim (>= 0.5 recommended)

## FEATURES

- [x] Query Mysql.
- [x] Query PostgreSql.
- [x] Query MariaDB.
- [x] Query Oracle.
- [ ] Query MongoDB (comming soon).
- [ ] Query MSsql (comming soon).
- [ ] Query Redis.
- [ ] Query MemCached.
- [ ] Query MinIO.

## PROS

- Fast simple and light.
- No lua or third-party dependencies.

## CONS

- There is no such `session` YET here, it's a **ONE QUERY HIT**, like a command you run inside a container, from outside, get the output and exit.
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
      },
    }
    ```

## HOW TO USE

- SetUp and start a Database Container depending on your choice, check [./examples/](./examples/).
- In your Code Editor, select a bunch of lines (your query).
- Execute depending on the Backend and get output in Command Line section.

## COMMANDS

Execute the visual selected lines on the first found running container :

- `DockDbExecuteMongo`
- `DockDbExecuteMySQL`
- `DockDbExecuteMSSQL`
- `DockDbExecuteMariaDB`
- `DockDbExecuteOracle`
- `DockDbExecutePostgresSQL`

See [examples](./examples/) for queries to play.

## SETUP OPTIONS

Options values are extremly flexible depending on the database you're using,
for example :
```lua
-- common config you could set on all engine
local common_conf = {
    username = 'u',
    password = 'p',
    database = 'TESTDB',
    hostname = 'localhost',
}
local dockdb_ops = {
    mysql = {
        port = '3306'
    },
    postgresql = {
        port = '5432'
    },
    oracle = {
        oracle_sid = 'XE',
        username = 'system', -- this will be used instead of 'u'
        port = '1521'
    },
    mongodb = {}
}
for _, config in pairs(dockdb_ops) do
    for k, v in pairs(common_conf) do
        -- You can use this to set the config for a specific
        -- engine to overide the defaulf from common_conf
        -- like for oracle.
        if config[k] == nil then
            config[k] = v
        end
    end
end
-- then we call dockdb
require("dockdb").setup(dockdb_ops)
```

## NOTE

If you have some ideas on how to upgrade this plugin i would be happy to read your issues, suggestions, Pull Requests.
But for now i will keep it simple since it does what i want it to do for now.

## AUTHOR

[sanix-darker](https://github.com/sanix-darker)
