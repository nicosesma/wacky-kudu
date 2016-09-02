var express = require('express')
var router = express.Router()

router.get('/', (request, response) => {
  const { Book, Author, Genre } = request.app.get('models')
  let search = request.query
  let searchOptions = Object.keys(search).map(v => search[v])

  console.log('h:', searchOptions)
  Promise.all([
    Book.findAll({
      where: { title: { ilike: '%' + searchOptions + '%' }}
    }),
    Author.findAll({
      where: { name: { ilike: '%' + searchOptions + '%' }}
    }),
    Genre.findAll({
      where: { name: { ilike: '%' + searchOptions + '%' }}
    })
  ])
    .then( results => {
      console.log('2:', results[0] );
      const books = results[0]
      const authors = results[1]
      const genres = results[2]
      response.render('books/search', {
        books: books,
        authors: authors,
        genres: genres
      })
    })
    .catch( error => response.send({ error, message: error.message }))
})

module.exports = router
