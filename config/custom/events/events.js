
var moment = require('moment');

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
