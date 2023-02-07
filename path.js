
var fs = require('fs')
var path = require('path')

;[
  'config/mysql/config.json',
  'config/pg/config.json',
  'config/sqlite/config.json',
  'config/custom.json',
].forEach((file) => {
  var fpath = path.resolve(__dirname, file)
  fs.writeFileSync(
    fpath,
    fs.readFileSync(fpath, 'utf8')
      .replace(/\/home\/s\/git\/express-admin-examples/g, __dirname),
    'utf8')
})
