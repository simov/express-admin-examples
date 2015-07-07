
# Express Admin Examples

This is the examples repository for [Express Admin][1]

Other locations:
- [Introductory Screencast][2]
- [Documentation][3]
- [System Tests][4]

## Install
```bash
$ git clone https://github.com/simov/express-admin-examples
$ cd express-admin-examples
$ npm install
```

## Create the schema and the test user
###### MySQL
```sql
CREATE SCHEMA `express-admin-examples` ;
CREATE USER liolio@localhost IDENTIFIED BY 'karamba' ;
GRANT ALL ON `express-admin-examples`.* TO liolio@localhost ;
```
###### PostgreSQL
```sql
create database "express-admin-examples";
-- create schema 'name'; (default: 'public')
create user liolio with password 'karamba';
grant all on database "express-admin-examples" to liolio;
```


## Import the schema and the test data

```bash
# MySQL
$ mysql -p --user=root 'express-admin-examples' < fixtures/mysql/schema.sql
$ mysql -p --user=root 'express-admin-examples' < fixtures/mysql/insert.sql

# PostgreSQL
$ sudo -u postgres psql 'express-admin-examples' < fixtures/pg/schema.sql
$ sudo -u postgres psql 'express-admin-examples' < fixtures/pg/insert.sql
# ... on Windows
> psql -U postgres express-admin-examples < fixtures/pg/schema.sql
> psql -U postgres express-admin-examples < fixtures/pg/insert.sql

# SQLite
$ node fixtures/sqlite/import.js
```
For SQLite you need to change the path to the database inside `config/sqlite/config.json`

## Run the Admin
```bash
# MySQL
$ admin config/mysql/

# PostgreSQL
$ admin config/pg/
# ... locally installed, on Linux
$ ./node_modules/.bin/admin config/pg
# ... locally installed, on Windows
> node_modules\.bin\admin config/pg

# SQLite
$ admin config/sqlite/
```

## Navigate to `http://localhost:3000`
Username: **admin**
Password: **11aaAA**


  [1]: https://github.com/simov/express-admin
  [2]: http://www.youtube.com/watch?v=1CdoCB96QNk
  [3]: http://simov.github.io/express-admin-site
  [4]: https://github.com/simov/express-admin-tests