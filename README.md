
# Express Admin Examples

> _Examples for [Express Admin]_

## Environment

- node >= 14
- npm
- docker
- docker-compose

## MySQL

```bash
# start MySQL database server
docker-compose up mysql
# login to the running container
docker exec -it x-admin-mysql bash
# login to mysql
mysql -u root -p
```
```sql
-- create database
create schema `x-admin-examples` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
```
```bash
# import schema
mysql -p --user=root 'x-admin-examples' < fixtures/mysql/schema.sql
mysql -p --user=root 'x-admin-examples' < fixtures/mysql/insert.sql
```

## PostgreSQL

```bash
# start PostgreSQL database server
docker-compose up mysql
# login to the running container
docker exec -it x-admin-pg bash
# login to psql
psql -U postgres
```
```sql
# create database
create database "x-admin-examples";
```
```bash
# import schema
psql -U postgres 'x-admin-examples' < fixtures/pg/schema.sql
psql -U postgres 'x-admin-examples' < fixtures/pg/insert.sql
```

## SQLite

```bash
# create database and import schema
node fixtures/sqlite-import.js
```

## Examples

```bash
# install test dependencies
npm install
# update absolute paths set inside the config folder
node path.js
# start the admin
node start.js mysql # or pg, sqlite
```

Navigate to http://localhost:3000 user `admin` pass `1234abCD`


  [Express Admin]: https://github.com/simov/express-admin
