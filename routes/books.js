var express = require('express');
var router = express.Router();

router.get('/', (request, response) => {
  response.render('books');
});

router.get('/add', (request, response) => {
  response.render('addBook');
});

router.get('/edit/:id', (request, response) => {
  response.render('editBook');
});

router.get('/:id', (request, response) => {
  response.render('details');
});

router.post('/', (request, response) => {
  response.redirect('/books/${bookId}');
});

router.post('/:id', (request, response) => {
  response.redirect('/books/${bookId}');
});

router.delete('/:id', (request, response) => {
  response.redirect('/books');
});

module.exports = router;
