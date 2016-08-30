var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(request, respond) {
  respond.render('index', { title: 'Home - Splash Page' });
});

module.exports = router;
