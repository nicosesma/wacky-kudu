var express = require('express')
var router = express.Router()

/* GET users listing. */
router.get('/', function(request, response) {
  response.render( 'users/home')

})

router.get('/profile', function(request, response) {
  const User = request.app.get('models').User

  User.findById(request.params.id)
    .then( user => response.render('users/profile', { user }))
    .catch( error => response.send({ error, message: error.message }) )
})

router.get('/edit/:id', function(request, response) {
  response.render('editUser')
})

router.post('/:id', function(request, response) {
  response.redirect('/${:id}')
})

module.exports = router
