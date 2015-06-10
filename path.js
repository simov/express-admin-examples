#!/usr/bin/env node
'use strict';

var fs = require('fs'),
    path = require('path'),
    util = require('util');

['mysql', 'pg', 'sqlite'].forEach(function (engine) {
	console.error( util.inspect(process.env) +"\n" );
	
	var cwd = (process.env.OS.match(/Windows/) !== null)?
			__dirname.replace(/\\/g, "/"):
			__dirname;
	
	console.error( "CWD: "+ cwd +"\n" );
	
    var fpath = path.join(cwd, './config/', engine, '/custom.json');

    var data = fs.readFileSync(fpath, 'utf8');
    fs.writeFileSync(fpath,
        data.replace(/\/home\/mighty\/node\/modules\/express-admin-examples/g, cwd)
    );
});
