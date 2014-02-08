
#Express Admin Examples

This is the examples repository for [Express Admin][1]

Other locations:
- [Introductory Screencast][2]
- [Documentation][3]

##Install
```bash
$ git clone https://github.com/simov/express-admin-examples
$ cd express-admin-examples
$ npm install
```

##Create the schema and the test user
######MySQL
```sql
CREATE SCHEMA `express-admin-examples` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
CREATE USER liolio@localhost IDENTIFIED BY 'karamba' ;
GRANT ALL ON `express-admin-examples`.* TO liolio@localhost ;
```
######PostgreSQL
```sql
create database "express-admin-examples";
-- create schema 'name'; (default: 'public')
create user liolio with password 'karamba';
grant all on database "express-admin-examples" to liolio;
-- public schema by default
grant all on schema "public" to liolio;
grant all on all tables in schema "public" to liolio;
grant all on all sequences in schema "public" to liolio;
```


##Import the schema and the test data
######MySQL
```bash
$ mysql -p --user=root 'express-admin-examples' < fixtures/examples/schema.sql
$ mysql -p --user=root 'express-admin-examples' < fixtures/examples/insert.sql
```
######PostgreSQL
```bash
$ sudo -u postgres psql 'express-admin-examples' < fixtures/pg-examples/schema.sql
$ sudo -u postgres psql 'express-admin-examples' < fixtures/pg-examples/insert.sql
```
######SQLite
```bash
$ cd fixtures/sqlite-examples/
$ node import.js
# change the path to the database inside `examples/sqlite-config/config.json`
```

##Run the Admin
```bash
# MySQL
$ admin examples/config/
# PostgreSQL
$ admin examples/pg-config/
# SQLite
$ admin examples/sqlite-config/
```

##Navigate to `http://localhost:3000`
Username: **admin**
Password: **11aaAA**


  [1]: https://github.com/simov/express-admin
  [2]: http://www.youtube.com/watch?v=1CdoCB96QNk
  [3]: http://simov.github.io/express-admin-site