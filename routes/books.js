var express = require('express');
var router = express.Router();

router.get('/', (request, response) => {
  response.render('books')
  .catch(
    error => response.send({ error, message: error.message }) )
})

router.get('/add', (request, response) => {
  response.render('addBook')
})

router.post('/', (request, response) => {
  const Book = request.app.get('models').Book
  Book.create(request.body)
  .then( book => {
    response.redirect('/books/' + book.id)
  }).catch(
    error => response.send({
      error, message: error.message }) )
});

router.get('/edit/:id', (request, response) => {
  response.render('editBook')
});

router.get('/:id', (request, response) => {
  const Book = request.app.get('models').Book
  Book.findById(request.params.id)
  .then( book => {
    response.render('details', {
      book
    })
  }).catch(
    error => response.send({
      error, message: error.message }) )

})

// updating book details
router.post('/:id', (request, response) => {
  response.redirect('/books/' + book.id);
});

router.delete('/:id', (request, response) => {
  response.redirect('/books');
});

module.exports = router;
