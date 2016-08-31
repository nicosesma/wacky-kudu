var express = require('express')
var router = express.Router()

router.get('/', (request, response) => {
  const { Book, Genre, Author } = request.app.get('models')

  Book.findAll({ include: [ Author, Genre ] })
    .then( books => {
      return response.render( 'books/list', { books })
    })
    .catch( error => response.send({ error, message: error.message }) )
})

router.get('/add', (request, response) => {
  response.render( 'books/form' )
})

router.post('/', (request, response) => {
  const Book = request.app.get('models').Book
  Book.create(request.body)
  .then( book => {
    response.redirect('/books/' + book.id)
  }).catch(
    error => response.send({
      error, message: error.message }) )
})

router.get('/:id', (request, response) => {
  const Book = request.app.get('models').Book

  Book.findById(request.params.id)
    .then( book => response.render('books/details', { book }))
    .catch( error => response.send({ error, message: error.message }) )
})

// updating book details
router.get('/edit/:id', (request, response) => {
  const Book = request.app.get('models').Book
  Book.findById(request.params.id)
  .then( book => {
    response.render('editBook', { book })
  }).catch(
    error => response.send({
      error, message: error.message }) )
})


router.post('/:id', (request, response) => {
  const Book = request.app.get('models').Book
  Book.update(request.params.id, {where: {id: request.params.id } })
  .then( book => {
    response.redirect('/books/' + book.id)
  }).catch(
    error => response.send({
      error, message: error.message }) )
})

router.delete('/:id', (request, response) => {
  response.redirect('/books')
})

module.exports = router
