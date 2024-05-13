# Dockdb.nvim

> This plugin is on *DEVELOPMENT MODE*, expect bugs and *BREAKING CHANGES* if using it for now.


https://github.com/Sanix-Darker/dockdb.nvim/assets/22576758/08160855-4ba4-47de-a9ba-ac5d218a92db


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
- [ ] Query Oracle (comming soon).
- [ ] Query MariaDB (comming soon).
- [ ] Query MongoDB (comming soon).
- [ ] Query MSsql (comming soon).
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
      },
    }
    ```

## HOW TO USE

- SetUp and start a Database Container depending on your choice:
    With given .env files :

    - PostgreSql : `docker run -d --rm --env-file .env.psql -p 5432:5432 postgres:latest`

    ```
    # .env.psql
    POSTGRES_PASSWORD=p
    POSTGRES_USER=u
    POSTGRES_DB=TESTDB
    ```

    - Mysql : `docker run -d --env-file .env.mysql -p 3306:3306 mysql:latest`

    ```
    # .env.mysql
    MYSQL_DATABASE=TESTDB
    MYSQL_USER=u
    MYSQL_PASSWORD=p
    MYSQL_ROOT_PASSWORD=p
    ```

    - MongoDB : `docker run --env-file .env.mongodb -p 27017:27017 mongodb:latest`

    ```
    # .env.mongodb

    ...comming soon..
    ```

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
local dockdb_ops = {
    mysql = {
        username = 'u',
        password = 'p',
        database = 'TESTDB',
        hostname = 'localhost',
        port = '3306'
    },
    postgresql = {
        username = 'u',
        password = 'p',
        database = 'TESTDB',
        hostname = 'localhost',
        port = '5432'
    },
    mongodb = {}
    -- ....
}
-- ... and so on
-- then forward it to dockdb
-- and you're all set
require("dockdb.nvim").setup(dockdb_ops)
```

## NOTE

If you have some ideas on how to upgrade this plugin i would be happy to read your issues, suggestions, Pull Requests.
But for now i will keep it simple since it does what i want it to do for now.

## AUTHOR

[sanix-darker](https://github.com/sanix-darker)
