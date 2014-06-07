
var express = require('express');
var app = module.exports = express();
var path = require('path');

var moment = require('moment');
// pie chart settings
var pie = require('./pie');

app.set('views', path.join(__dirname, 'views'));


app.get(/\/stats(?:\/(\w+))?/, function (req, res, next) {
    // reuse the admin's database connection
    var db = res.locals._admin.db;

    // get the month from the url
    var month = req.params[0] || 'january';

    queryDatabase(db, month, function (err, rows, total) {
        if (err) return next(err);

        // pie chart's settings
        res.locals.chart = JSON.stringify(pie.chart(month, rows, total));
        // month's select control data
        res.locals.months = getMonths(month);

        next();
    });
});

app.post(/\/stats(?:\/(\w+))?/, function (req, res, next) {
    // reuse the admin's database connection
    var db = res.locals._admin.db;

    // get the month from the POST params
    var month = req.body.month;
    
    queryDatabase(db, month, function (err, rows, total) {
        if (err) return next(err);

        // pie chart's settings
        res.locals.chart = JSON.stringify(pie.chart(month, rows, total));
        // month's select control data
        res.locals.months = getMonths(month);

        next();
    });
});

// common data for each request to this view
app.all(/\/stats(?:\/(\w+))?/, function (req, res, next) {
    var relative = path.relative(res.locals._admin.views, app.get('views'));

    res.locals.breadcrumbs = {
        links: [
            {url: '/', text: res.locals.string.home},
            {active: true, text: 'Statistics'}
        ]
    };
    
    res.locals.partials = {
        content: path.join(relative, 'form'),
        readme:  path.join(relative, 'readme')
    };

    next();
});

function getMonths (month) {
    var months = [
        {value: 'january', text: 'January'},
        {value: 'february', text: 'February'},
        {value: 'mart', text: 'Mart'},
        {value: 'april', text: 'April'},
        {value: 'may', text: 'May'},
        {value: 'june', text: 'June'}
    ];
    // set the selected month
    for (var i=0; i < months.length; i++) {
        if (months[i].value === month) {
            months[i].selected = true;
            break;
        }
    }
    return months;
}

function queryDatabase (db, month, cb) {
    // find the first and last date of the selected month (all test dates are in 2012)
    var date  = moment('2012-'+month, 'YYYY-MMMM'),
        first = date.startOf('month').format('YYYY-MM-DD'),
        last  = date.endOf('month').format('YYYY-MM-DD');

    // group by item and sum its cache for the selected month
    var sql = "select `name`, SUM(`cache`) as 'total'\
                from `purchase` join `item`\
                on `purchase`.`item_id` = `item`.`id`\
                where DATE(`date`) between '"+first+"' and '"+last+"'\
                group by `item_id`;";
    db.client.query(sql, function (err, items) {
        if (err) return cb(err);
        // total spend cache for this month
        var sql = "select SUM(`cache`) as 'total'\
                    from `purchase`\
                    where DATE(`date`) between '"+first+"' and '"+last+"';";
        db.client.query(sql, function (err, sum) {
            if (err) return cb(err);
            
            // queries results
            var rows  = items,
                total = sum[0].total;

            cb(null, rows, total);
        });
    });
}
