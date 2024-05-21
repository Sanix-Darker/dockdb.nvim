local Docker = require('..lua.docker')
local Mysql = require('..lua.mysql')
local MariaDB = require('..lua.mariadb')
local Postgresql = require('..lua.postgresql')
local vim = {}
vim.api = {}
vim.fn = {}

-- Mocking the 'vim' global variable
_G.vim = vim

describe('GetDockerContainerID', function()
    it('should return a container ID from the image name', function()
        -- Mock the vim.fn.systemlist function
        vim.fn.systemlist = function(command)
            return {"container_id_1", "container_id_2"}
        end

        local image_name = 'my_image'
        local expected = "container_id_1\ncontainer_id_2"
        local result = Docker.GetDockerContainerID(image_name)
        assert.are.equal(expected, result)
    end)
end)

describe('BuildMySQLQuery', function()
    it('should build a MySQL query command with the given config', function()
        local sql_config = {
            hostname = 'localhost',
            port = 3306,
            username = 'user',
            password = 'password',
            database = 'my_database'
        }
        local sql_query = 'SELECT * FROM my_table'

        local expected_query = 'SELECT * FROM my_table'
        local expected_command = "bash -c 'MYSQL_PWD=password mysql -h localhost -P 3306 -u user -D my_database'"
        local expected_image_name = 'mysql'

        local query, command, image_name = Mysql.BuildMySQLQuery(sql_config, sql_query)
        assert.are.equal(expected_query, query)
        assert.are.equal(expected_command, command)
        assert.are.equal(expected_image_name, image_name)
    end)
end)

describe('BuildMariaDBQuery', function()
    it('should build a MariaDB query command with the given config', function()
        local sql_config = {
            hostname = 'localhost',
            port = 3306,
            username = 'user',
            password = 'password',
            database = 'my_database'
        }
        local sql_query = 'SELECT * FROM my_table'

        local expected_query = 'SELECT * FROM my_table'
        local expected_command = "bash -c 'MYSQL_PWD=password mariadb -h localhost -P 3306 -u user -D my_database'"
        local expected_image_name = 'mariadb'

        local query, command, image_name = MariaDB.BuildMariaDBQuery(sql_config, sql_query)
        assert.are.equal(expected_query, query)
        assert.are.equal(expected_command, command)
        assert.are.equal(expected_image_name, image_name)
    end)
end)

describe('BuildPostgresSQLQuery', function()
    it('should build a PostgreSQL query command with the given config', function()
        local sql_config = {
            hostname = 'localhost',
            port = 5432,
            username = 'user',
            password = 'password',
            database = 'my_database'
        }
        local sql_query = 'SELECT * FROM my_table'

        local expected_query = "SELECT * FROM my_table"
        local expected_command = "bash -c 'PGPASSWORD=password psql -h localhost -p 5432 -U user -d my_database'"
        local expected_image_name = 'postgres'

        local query, command, image_name = Postgresql.BuildPostgresSQLQuery(sql_config, sql_query)
        assert.are.equal(expected_query, query)
        assert.are.equal(expected_command, command)
        assert.are.equal(expected_image_name, image_name)
    end)
end)
