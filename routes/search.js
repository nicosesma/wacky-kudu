var express = require('express')
var router = express.Router()

router.get('/', (request, response) => {
  const Book = request.app.get('models').Book
  let search = request.query
  let searchOptions = Object.keys(search).map(v => search[v])

  console.log('h:', searchOptions)
  Book.findAll({
    where: { title: { ilike: '%' + searchOptions + '%' }}
  })
    .then( results => {
      console.log('2:', results );
      // const { rows: books } = results
      // console.log('3:', books);
      response.render('books/search', { results })
    })
    .catch( error => response.send({ error, message: error.message }))
})

module.exports = router
