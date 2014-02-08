
var fs = require('fs');
if (fs.existsSync('db.sqlite'))
    fs.unlinkSync('db.sqlite');

var sqlite3 = require('sqlite3').verbose();
var db = new sqlite3.Database('db.sqlite');

var schema = fs.readFileSync('schema.sql', 'utf8');
var insert = fs.readFileSync('insert.sql', 'utf8');

db.serialize(function() {
    db.exec(schema);
    db.exec(insert);
});

db.close();