
var moment = require('moment');

function quotes (args, result) {
    return args.db.client.pg ? result.replace(/`/g,'"') : result;
}


exports.preSave = function (req, res, args, next) {
    if (args.debug) console.log('preSave');
    debugger;

    // created_at, updated_at
    if (args.name == 'user') {
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
        var now = moment(new Date()).format('YYYY-MM-DD hh:mm:ss');
        // all inline oneToOne and manyToOne records should be marked as deleted
        for (var table in args.data.manyToOne) {
            var inline = args.data.manyToOne[table];
            if (!inline.records) continue;
            for (var i=0; i < inline.records.length; i++) {
                if (args.action != 'remove' && !inline.records[i].remove) continue;
                // instead of deleting the record
                delete inline.records[i].remove;
                // update it
                inline.records[i].columns.deleted = (args.db.client.sqlite ? 1 : true);
                inline.records[i].columns.deleted_at = now;
            }
        }
        // parent record
        if (args.action == 'remove') {
            // instead of deleting the record
            args.action = 'update';
            // update it
            var record = args.data.view.purchase.records[0].columns;
            record.deleted = (args.db.client.sqlite ? 1 : true);
            record.deleted_at = now;
        }
    }

    next();
}


// upload image to cloudinary.com
var config = {
    cloud_name: '',
    api_key: '',
    api_secret: ''
};
if (config.api_secret) {
    var cloudinary = require('cloudinary'),
        fs = require('fs'),
        path = require('path');
    cloudinary.config(config);
}

exports.postSave = function (req, res, args, next) {
    if (args.debug) console.log('postSave');
    debugger;

    // upload image to a third party server
    if (args.name == 'item') {
        // provide your credentials to cloudinary.com
        if (!config.api_secret) return next();
        // file upload control data
        var image = args.upload.view.item.records[0].columns.image;
        // in case file is chosen through the file input control
        if (image.name) {
            // file name of the image already uploaded to the upload folder
            var fname = args.data.view.item.records[0].columns.image;
            // upload
            var fpath = path.join(args.upath, fname);
            cloudinary.uploader.upload(fpath, function (result) {
                console.log(result);
                next();
            });
        }
        else next();
    }
    else next();
}


exports.preList = function (req, res, args, next) {
    if (args.debug) console.log('preList');
    debugger;

    if (args.name == 'purchase') {
        // check if we're using listview's filter
        // and actually want to see soft deleted records
        var filter = args.filter.columns;
        if (filter && (filter.deleted=='1' || filter.deleted_at && filter.deleted_at[0])) {
            return next();
        }
        // otherwise hide the soft deleted records by default
        var filter = quotes(args,
            ' `purchase`.`deleted` IS NULL OR `purchase`.`deleted` = ' +
            (args.db.client.pg ? 'false' : 0) +
            ' OR `purchase`.`deleted_at` IS NULL ');
        args.statements.where
            ? args.statements.where += ' AND ' + filter
            : args.statements.where = ' WHERE ' + filter
    }

    next();
}
