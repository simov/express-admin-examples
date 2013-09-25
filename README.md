
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
```sql
CREATE SCHEMA `express-admin-examples` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
CREATE USER liolio@localhost IDENTIFIED BY 'karamba' ;
GRANT ALL ON `express-admin-examples`.* TO liolio@localhost ;
```

##Import the schema and the test data
```bash
$ mysql -p --user=root 'express-admin-examples' < fixtures/examples/schema.sql
$ mysql -p --user=root 'express-admin-examples' < fixtures/examples/insert.sql
```

##Run the Admin
```bash
$ admin examples/config/
```

##Navigate to `http://localhost:3000`
Username: **admin**
Password: **11aaAA**


  [1]: https://github.com/simov/express-admin
  [2]: http://www.youtube.com/watch?v=1CdoCB96QNk
  [3]: http://simov.github.io/express-admin-site