
exports.preSave = function (req, res, args, next) {
    console.log('preSave');
    next();
}

exports.postSave = function (req, res, args, next) {
    console.log('postSave');
    next();
}
