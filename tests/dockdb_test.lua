local Docker = require('..lua.docker')
local Mysql = require('..lua.mysql')
local MariaDB = require('..lua.mariadb')
local Postgresql = require('..lua.postgresql')
local Oracle = require('..lua.oracle')
local mongodb= require('..lua.mongodb')
local redis= require('..lua.redis')

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
        local config = {
            hostname = 'localhost',
            port = 3306,
            username = 'user',
            password = 'password',
            database = 'my_database'
        }
        local query = 'SELECT * FROM my_table'

        local expected_query = 'SELECT * FROM my_table'
        local expected_command = "bash -c 'MYSQL_PWD=password mysql -u user -D my_database'"
        local expected_image_name = 'mysql'

        local xquery, command, image_name = Mysql.BuildMySQLQuery(config, query)
        assert.are.equal(expected_query, xquery)
        assert.are.equal(expected_command, command)
        assert.are.equal(expected_image_name, image_name)
    end)
end)

describe('BuildMariaDBQuery', function()
    it('should build a MariaDB query command with the given config', function()
        local config = {
            hostname = 'localhost',
            port = 3306,
            username = 'user',
            password = 'password',
            database = 'my_database'
        }
        local query = 'SELECT * FROM my_table'

        local expected_query = 'SELECT * FROM my_table'
        local expected_command = "bash -c 'MYSQL_PWD=password mariadb -u user -D my_database'"
        local expected_image_name = 'mariadb'

        local xquery, command, image_name = MariaDB.BuildMariaQuery(config, query)
        assert.are.equal(expected_query, xquery)
        assert.are.equal(expected_command, command)
        assert.are.equal(expected_image_name, image_name)
    end)
end)

describe('BuildPostgresSQLQuery', function()
    it('should build a PostgreSQL query command with the given config', function()
        local config = {
            hostname = 'localhost',
            port = 5432,
            username = 'user',
            password = 'password',
            database = 'my_database'
        }
        local query = 'SELECT * FROM my_table'

        local expected_query = "SELECT * FROM my_table"
        local expected_command = "bash -c 'PGPASSWORD=password psql -U user -d my_database'"
        local expected_image_name = 'postgres'

        local xquery, command, image_name = Postgresql.BuildPostgresSQLQuery(config, query)
        assert.are.equal(expected_query, xquery)
        assert.are.equal(expected_command, command)
        assert.are.equal(expected_image_name, image_name)
    end)
end)

describe('BuildOracleQuery', function()
    it('should build a Oracle query command with the given config', function()
        local config = {
            hostname = 'localhost',
            port = 1521,
            username = 'user',
            password = 'password',
            database = 'my_database',
            oracle_sid = 'XE'
        }
        local query = 'SELECT * FROM my_table'

        local expected_query = "SELECT * FROM my_table"
        local expected_command = "bash -c 'sqlplus user/password@//localhost:1521/XE'"
        local expected_image_name = 'gvenzl/oracle-xe'

        local xquery, command, image_name = Oracle.BuildOracleQuery(config, query)
        assert.are.equal(expected_query, xquery)
        assert.are.equal(expected_command, command)
        assert.are.equal(expected_image_name, image_name)
    end)
end)

describe('BuildMongoDBQuery', function()
    it('should build a Mongo query command with the given config', function()
        local config = {
            hostname = 'localhost',
            port = 1521,
            username = 'user',
            password = 'password',
            database = 'my_database',
        }
        local query = 'use admin \n show collections'

        local expected_query = "use admin \n show collections"
        local expected_command = "bash -c 'mongosh -u user -p password'"
        local expected_image_name = 'mongo'

        local xquery, command, image_name = mongodb.BuildMongoQuery(config, query)
        assert.are.equal(expected_query, xquery)
        assert.are.equal(expected_command, command)
        assert.are.equal(expected_image_name, image_name)
    end)
end)

describe('BuildRedisQuery', function()
    it('should build a Redis query command with the given config', function()
        local config = {
            hostname = 'localhost',
            port = 6479,
            password = 'password',
        }

        local query = 'SET xkey "sanix darker" \n GET xkey'

        local expected_query = 'SET xkey "sanix darker" \n GET xkey'
        local expected_command = "bash -c 'REDIS_PASSWORD=password redis-cli'"
        local expected_image_name = 'redis'

        local xquery, command, image_name = redis.BuildRedisQuery(config, query)
        assert.are.equal(expected_query, xquery)
        assert.are.equal(expected_command, command)
        assert.are.equal(expected_image_name, image_name)
    end)
end)
