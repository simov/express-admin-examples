
var moment = require('moment');

function quotes (args, result) {
    return args.db.client.pg ? result.replace(/`/g,'"') : result;
}


exports.preSave = function (req, res, args, next) {
    debugger;
    if (args.debug) console.log('preSave');

    if (args.slug == 'user') {
        var now = moment(new Date()).format('YYYY-MM-DD hh:mm:ss'),
            record = args.data.view.user.records[0].columns;
        if (args.action == 'insert') {
            record.created_at = now;
            record.updated_at = now;
        }
        else if (args.action == 'update') {
            record.updated_at = now;
        }
    }

    // soft delete
    if (args.name == 'purchase') {
        debugger;

        var now = moment(new Date()).format('YYYY-MM-DD hh:mm:ss');
        
        // all inline oneToOne and manyToOne records should be marked as deleted
        for (var name in args.data.manyToOne) {
            var table = args.data.manyToOne[name];
            if (!table.records) continue;
            for (var i=0; i < table.records.length; i++) {
                if (args.action != 'remove' && !table.records[i].remove) continue;
                delete table.records[i].remove;
                table.records[i].columns.deleted = (args.db.client.sqlite ? 1 : true);
                table.records[i].columns.deleted_at = now;
            }
        }

        // parent record
        if (args.action != 'remove') return next();

        args.action = 'update';

        var record = args.data.view.purchase.records[0].columns;

        record.deleted = (args.db.client.sqlite ? 1 : true);
        record.deleted_at = now;

        // warning: manyToMany records are not removed
    }
    
    next();
}


var http = require('http');

exports.postSave = function (req, res, args, next) {
    debugger;
    if (args.debug) console.log('postSave');

    // enable this event only for the cars table
    if (args.slug != 'car') return next();

    http.request({
            hostname: 'api.openweathermap.org',
            port: 80,
            path: '/data/2.5/weather?q=London,uk',
            method: 'GET'
        }, function (res) {
            var buff = '';
            res.on('data', function (chunk) {
                buff += chunk;
            })
            .on('end', function () {
                try {
                    var data = JSON.parse(buff.toString());
                } catch (e) {
                    var error = new Error(res.raw);
                }
                console.log(data);

                next();
            });
        })
        .on('error', function (err) {
            console.log('Network Error!');
            next();
        })
        .end();
}

exports.preList = function (req, res, args, next) {
    debugger;
    if (args.debug) console.log('preList');

    // filter out soft deleted records

    // we are interested only in purchase table
    if (args.name != 'purchase') return next();

    // check if we actually want to see the deleted columns
    var filter = args.filter.columns;
    if (filter && (filter.deleted=='1' || filter.deleted_at && filter.deleted_at[0])) {
        return next();
    }

    // custom filter to apply

    var filter = quotes(args,
        ' `purchase`.`deleted` IS NULL OR `purchase`.`deleted` = ' +
        (args.db.client.pg ? 'false' : 0) +
        ' OR `purchase`.`deleted_at` IS NULL ');

    // WHERE statement position
    var idx = args.query.indexOf('GROUP BY');

    // list view query
    if (args.query.indexOf('WHERE') == -1) {
        args.query = args.query.slice(0,idx) + ' WHERE ' + filter + args.query.slice(idx);
    } else {
        args.query = args.query.slice(0,idx) + ' AND ' + filter + args.query.slice(idx);
    }

    // used in pagination query
    if (!args.statements.where) {
        args.statements.where = ' WHERE ' + filter;
    } else {
        args.statements.where += ' AND ' + filter;
    }

    next();
}
