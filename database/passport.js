const passport = require('passport')
const LocalStrategy = require('passport-local').Strategy
const Sequelize = require( 'sequelize' )
const bcrypt = require('bcrypt')

const User = require('./models').User

const OPTIONS = {
  usernameField: 'email'
}

const findUser = ( email, password ) => {
  const where = { email, password }

  return User.findOne({ where })
}

const strategy = new LocalStrategy( OPTIONS, ( email, password, done ) => {
  findUser( email, password)
    .then( user => {
      if( !user ){
        return done( null, false, { message: "WRONG! Check password or email" })
      } else {
        done( null, user)
      }
    }).catch( error => done( err ))
})

passport.use( strategy )

passport.serializeUser( ( user, done ) => done( null, user.id ) )

passport.deserializeUser( ( id, done ) => {
  User.findById( id )
    .then( user => done( null, user ))
    .catch( error => done( error, null ))
})

module.exports = passport
