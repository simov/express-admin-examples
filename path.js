#!/usr/bin/env node

var fs = require('fs'),
    path = require('path');

['mysql', 'pg', 'sqlite'].forEach(function (engine) {
    var fpath = path.join(__dirname, './config/', engine, '/custom.json');

    var data = fs.readFileSync(fpath, 'utf8');
    fs.writeFileSync(fpath,
        data.replace(/\/home\/mighty\/node\/modules\/express-admin-examples/g, __dirname)
    );
});
