
# Express Admin Examples

> _Examples for [Express Admin]_

## Environment

- node >= 14
- npm
- docker
- docker-compose

## MySQL

```bash
# start MySQL database server (pick one)
docker-compose up mysql
docker-compose up mysql5
docker-compose up mariadb
# login to the running container (pick one)
docker exec -it x-admin-mysql bash
docker exec -it x-admin-mysql-5 bash
docker exec -it x-admin-mariadb bash
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
# start PostgreSQL database server (pick one)
docker-compose up pg
docker-compose up pg9
# login to the running container (pick one)
docker exec -it x-admin-pg bash
docker exec -it x-admin-pg-9 bash
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

## Diagrams

[MySQL Workbench] can be used to preview the [database diagrams].


  [Express Admin]: https://github.com/simov/express-admin
  [MySQL Workbench]: https://www.mysql.com/products/workbench/
  [database diagrams]: https://github.com/simov/express-admin-examples/blob/master/fixtures/x-admin-examples.mwb
