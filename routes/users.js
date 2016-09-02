var express = require('express')
var router = express.Router()

const passport = require( '../database/passport' )
const AUTH_OPTIONS = {
  successRedirect: '/',
  failureRedirect: '/users/signin'
}

/* GET users listing. */
router.get('/', function(request, response) {
  response.render( 'users/home')

})

router.get('/profile/:id', function(request, response) {
  const User = request.app.get('models').User

  User.findById( request.params.id )
    .then( user => response.render( 'users/profile', { user }))
    .catch( error => response.send({ error, message: error.message }) )
})

router.get('/edit/:id', function(request, response) {
  response.render('editUser')
})

router.get('/signin', (request, response) => {
  response.render('users/signin')
})
router.post( '/signin', passport.authenticate( 'local', AUTH_OPTIONS ))

router.get('/signup', (request, response) => {
  response.render('users/signup')
})

router.post( '/signup', (request, response) => {
  const User = request.app.get('models').User

  User.create( request.body )
    .then( result => response.redirect( `/users/profile/${result.id}` ))
    .catch( error => response.send({ error, message: error.message }) )

})

module.exports = router
