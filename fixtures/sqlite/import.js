
var fs = require('fs'),
    path = require('path');

if (fs.existsSync(path.join(__dirname,'db.sqlite')))
    fs.unlinkSync(path.join(__dirname,'db.sqlite'));

var sqlite3 = require('sqlite3').verbose();
var db = new sqlite3.Database(path.join(__dirname,'db.sqlite'));

var schema = fs.readFileSync(path.join(__dirname,'schema.sql'), 'utf8');
var insert = fs.readFileSync(path.join(__dirname,'insert.sql'), 'utf8');

db.serialize(function() {
    db.exec(schema);
    db.exec(insert);
});

db.close();
