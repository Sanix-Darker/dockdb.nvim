## HOW TO START DOCKER DBMS

### [SUPPORTED] POSTGRESQL

With the given `.env.psql`, you can run:

```bash
$ docker run -d --rm \
    --env-file .env.psql \
    -p 5432:5432 postgres:latest
```

### [SUPPORTED] MYSQL / MARIADB

Same as psql, in `.env.mysql` for Mysql and MariaDB, you can just run:

```bash
$ docker run -d --rm \
    --env-file .env.mysql \
    -p 3306:3306 mysql:latest
```

### [SUPPORTED] ORACLE

To run an Oracle database with docker, you can hit :
```bash
$ docker run -d --rm \
    --env-file .env.oracle \
    -p 1521:1521 gvenzl/oracle-xe
```

### MONGODB

To start a mongoDB instance, you can run :

```bash
$ docker run -d --rm \
    --env-file .env.mongodb \
    -p 27017:27017 mongo:latest
```

After that you can run queries directly to create the database and the collections.

```
> use TESTDB # this will create the database directly
> db.createCollection("test_collection")
> show dbs
> show collections
```
