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

### [SUPPORTED] MONGODB

To start a mongoDB instance, you can run :

```bash
$ docker run -d --rm \
    --env-file .env.mongodb \
    -p 27017:27017 mongo:latest
```

### [SUPPORTED] REDIS

To start a redis instance, you can run :

```bash
$ docker run -d --rm \
    --env-file .env.redis \
    -p 6479:6479 redis:latest
```

### [SUPPORTED] MEMCACHED

To start a redis instance, you can run :

```bash
$ docker run -d --rm \
    -p 11211:11211 memcached:latest

# NOTE: telnet need to be installed
# You can do that using the root user while the container is running
# docker exec -u root memcached apt-get update -y
# docker exec -u root memcached apt-get install -y telnet
```
