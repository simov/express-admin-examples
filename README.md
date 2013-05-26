
#Express Admin Examples

This is the examples repository for [Express Admin][1]

[Documentation][2]

##Preparations

###Create the schema and the test user
```sql
CREATE SCHEMA `express-admin-examples` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
CREATE USER liolio@localhost IDENTIFIED BY 'karamba' ;
GRANT ALL ON `express-admin-examples`.* TO liolio@localhost ;
```

###Import the schema and some test data
```bash
$ mysql -p --user=root --default_character_set utf8 'express-admin-examples' < fixtures/examples/schema.sql
$ mysql -p --user=root --default_character_set utf8 'express-admin-examples' < fixtures/examples/insert.sql
```

##Run the Admin

```bash
$ admin examples/config/
```
user: admin, pass: admin

##Enjoy

Navigate to `http://localhost:3000`

##Other examples

Apply the above steps for any other example in this repository. Just change the schema name and the file paths. The test user is created only once and the permissions are granted once for each schema.


  [1]: https://github.com/simov/express-admin
  [2]: https://simov.github.com/express-admin-site