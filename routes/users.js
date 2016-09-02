var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(request, response) {
  response.render('users');
});

router.get('/:id', function(request, response) {
  response.render('profile');
});

router.get('/edit/:id', function(request, response) {
  response.render('editUser');
});

router.post('/:id', function(request, response) {
  response.redirect('/${:id}')
})

router.get('/signin', (request, response) => {
  response.render('signin')
})

router.get('/signup', (request, response) => {
  response.render('signup')
})

module.exports = router;
