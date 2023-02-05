
var express = require('express')
var app = module.exports = express()
var fs = require('fs')
var path = require('path')

// set your custom views path
app.set('views', path.join(__dirname, 'views'))

app.post(/^\/upload.*$/i, (req, res, next) => {
  var file = req.files.upload
  // file.name // file-name.jpg
  // file.path // /tmp/9c9b10b72fe71be752bd3895f1185bc8
  // file.size // 27124
  // file.type // image/jpeg

  var source = file.path
  var target = path.join(path.resolve(__dirname, 'uploads'), file.name)

  fs.readFile(source, (err, data) => {
    if (err) return next(err)
    getname(target, (target, fname) => {
      fs.writeFile(target, data, (err) => {
        if (err) return next(err)
        // render custom page inside the editor's popup frame
        res.locals.path = '/uploads/'+fname
        var template = path.resolve(__dirname, 'upload.html')
        res.render(template)
      })
    })
  })
})

// prevent overriding existing files
function getname (target, done) {
  var ext = path.extname(target)
  var fname = path.basename(target, ext)
  var dpath = path.dirname(target)
  fs.exists(target, (exists) => {
    return exists ? loop(1) : done(target, fname+ext)
  })
  function loop (i) {
    var name = fname+'-'+i
    var fpath = path.join(dpath, name+ext)
    fs.exists(fpath, (exists) => {
      return exists ? loop(++i) : done(fpath, name+ext)
    })
  }
}
