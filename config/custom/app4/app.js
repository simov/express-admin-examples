
var express = require('express');
var app = module.exports = express();
var path = require('path');

app.set('views', path.join(__dirname, 'views'));

app.get('/view4', function (req, res, next) {
    
    var relative = path.relative(res.locals._admin.views, app.get('views'));

    res.locals.breadcrumbs = {
        links: [
            {url: '/', text: res.locals.string.home},
            {active: true, text: 'Breadcrumbs'}
        ]
    };
    
    res.locals.partials = {
        content: path.join(relative, 'view')
    };

    next();
});
