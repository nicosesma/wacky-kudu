const express = require('express')
const path = require('path')
const session = require('express-session')
const favicon = require('serve-favicon')
const logger = require('morgan')
const cookieParser = require('cookie-parser')
const bodyParser = require('body-parser')
const passport = require( 'passport')

const routes = require('./routes/index')
const users = require('./routes/users')
const books = require('./routes/books')
const signup = require('./routes/signup')
const signin = require('./routes/signin')
const test = require('./routes/test')
const models = require( './database/models' )

const app = express()

// view engine setup
app.set('views', path.join(__dirname, 'views'))
app.set('view engine', 'pug')
app.set( 'models', models )

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')))
app.use(logger('dev'))
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))
app.use(cookieParser())
app.use(express.static(path.join(__dirname, 'public')))
app.use(session({ secret: 'keyboard cat', cookie: {} }))
app.use(passport.initialize())

app.use(passport.session())

app.use('/', routes)
app.use('/users', users)
app.use('/books', books)
app.use('/signup', signup)
app.use('/signin', signin)
app.use('/test', test)

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  const err = new Error('Not Found')
  err.status = 404
  next(err)
})

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
  app.use(function(err, req, res, next) {
    res.status(err.status || 500)
    res.render('error', {
      message: err.message,
      error: err
    })
  })
}

// production error handler
// no stacktraces leaked to user
app.use(function(err, req, res, next) {
  res.status(err.status || 500)
  res.render('error', {
    message: err.message,
    error: {}
  })
})

module.exports = app
