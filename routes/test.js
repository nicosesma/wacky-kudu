const express = require('express')
const router = express.Router()

router.get( '/', (request, response) => {
  const User = request.app.get('models').User

  User.create({
    username: 'jrob',
    email: 'john@learnersguild.org',
    password: 'password' }
  ).then( user => {
    console.log( user )
    response.send( user )
  })
})

module.exports = router
