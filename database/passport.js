const passport = require('passport')
const localStrategy = require('passport-local').Strategy
const Sequelize = require( 'sequelize' )
const bcrypt = require('bcrypt')

const findUser = ( email, password ) => {

  const { email, password } = request.params
  const where = { email, password }

  return User.findOne( where)
}

const strategy = new LocalStrategy( (email,password, done) => {
  findUser( email, password)
    .then( user => {
      if(!user){
        return done( null, false, { message: "WRONG! Check password or email" })
      } else {
        done( null, user)
      }
    }).catch( error => done( err ))
})

passport.use (strategy)

passport.serializeUser( ( user, done ) => done( null, user.id ) )

passport.deserializeUser( ( id, done ) => {
  User.findById( id )
    .then( user => done( null, user ))
    .catch( error => done( error, null ))
})

module.exports = passport
