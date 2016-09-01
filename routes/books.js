var express = require('express')
var router = express.Router()

const PAGE_SIZE = 10

router.get('/', (request, response) => {
  const { Book, Genre, Author } = request.app.get('models')
  let page = Math.max( parseInt( request.query.page ) || 1, 1 )

  Book.findAndCountAll({
      include: [ Author, Genre ],
      limit: PAGE_SIZE,
      offset: PAGE_SIZE * (page - 1)
    })
    .then( result => {
      const { rows: books, count } = result
      const pages = count / PAGE_SIZE

      return response.render( 'books/list', { books, count, pages, page })
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
  Book.findById( parseInt(request.params.id ))
  .then( book => {
    response.render('editBook', { book })
  }).catch(
    error => response.send({
      error, message: error.message }) )
})



router.post('/:id', (request, response) => {
  const Book = request.app.get('models').Book

  const { id } = request.params
  const where = { id: parseInt( id ) }

  Book.update( request.body, { where })
  .then( book => {
    console.log( book )
    response.redirect( `/books/${id}` )
  }).catch(
    error => response.send({
      error, message: error.message }) )
})

router.get('/delete/:id', (request, response) => {
  const Book = request.app.get('models').Book
  Book.destroy({where: {id: request.params.id } })
    .then( result => response.redirect('/books'))
    .catch( error => res.send({ error, message: error.message }))
})

module.exports = router
