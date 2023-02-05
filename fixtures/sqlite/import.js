
var fs = require('fs')
var path = require('path')
var sqlite3 = require('sqlite3').verbose()

var db = path.join(__dirname, 'x-admin-examples.sqlite')
var schema = fs.readFileSync(path.join(__dirname, 'schema.sql'), 'utf8')
var insert = fs.readFileSync(path.join(__dirname, 'insert.sql'), 'utf8')

if (fs.existsSync(db)) {
  fs.unlinkSync(db)
}

var connection = new sqlite3.Database(db)

connection.serialize(() => {
  connection.exec(schema)
  connection.exec(insert)
})

connection.close()
