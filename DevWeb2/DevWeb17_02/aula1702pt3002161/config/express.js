var express = require('express');
var home = require('../app/routes/home');
module.exports = function(){
    var app = express();
    app.set('port', 8090);
    //Middleware
    app.use(express.static('./public'));
    app.set('view engine', 'ejs');
    app.set('views', './app/views');
    home(app);
    return app;
};