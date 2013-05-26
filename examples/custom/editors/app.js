
var express = require('express');
var app = module.exports = express();
var fs = require('fs');
var path = require('path');

// set your custom views path
app.set('views', path.join(__dirname, 'views'));

app.post(/^\/upload.*$/i, function (req, res, next) {
    var file = req.files.upload;
    // file.name; // file-name.jpg
    // file.path; // /tmp/9c9b10b72fe71be752bd3895f1185bc8
    // file.size; // 27124
    // file.type; // image/jpeg

    var source = file.path,
        target = path.join(path.resolve(__dirname, 'uploads'), file.name);

    fs.readFile(source, function (err, data) {
        if (err) return next(err);
        getname(target, function (target, fname) {
            fs.writeFile(target, data, function (err) {
                if (err) return next(err);
                // render custom page inside the editor's popup frame
                res.locals.path = '/uploads/'+fname;
                var template = path.resolve(__dirname, 'upload.html');
                res.render(template);
            });
        });
    });
});

// prevent overriding existing files
function getname (target, cb) {
    var ext = path.extname(target),
        fname = path.basename(target, ext),
        dpath = path.dirname(target);
    fs.exists(target, function (exists) {
        return exists ? loop(1) : cb(target, fname+ext);
    });
    function loop (i) {
        var name = fname+'-'+i,
            fpath = path.join(dpath, name+ext);
        fs.exists(fpath, function (exists) {
            return exists ? loop(++i) : cb(fpath, name+ext);
        });
    }
}
