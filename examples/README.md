## HOW TO START DOCKER DBMS

### [supported] POSTGRESQL

With the given `.env.psql`, you can run:

`docker run -d --rm --env-file .env.psql -p 5432:5432 postgres:latest`

### [supported] MYSQL / MARIADB

Same as psql, in `.env.mysql` for Mysql and MariaDB, you can just run:

`docker run -d --env-file .env.mysql -p 3306:3306 mysql:latest`


### MONGODB

To start a mongoDB instance, you can run : `docker run -d --env-file .env.mongodb -p 27017:27017 mongo:latest`
After that you can run queries directly to create the database and the collections.
```
> use TESTDB # this will create the database directly
> db.createCollection("test_collection")
> show dbs
> show collections
```
