var express = require('express')
var router = express.Router()
// Object.keys(data).map(k => data[k])
router.get('/', (request, response) => {
  const Book = request.app.get('models').Book
  let search = request.query
  let searchOptions = Object.keys(search).map(v => search[v])

  console.log('h:', searchOptions)
  Book.findAll({
    where: { title: { ilike: '%' + searchOptions + '%' }}
  })
    // .success( books => {
    //   for( let i=0; i<books.length; i++){
    //     console.log(books[i].title + " " + books[i].description);
    //   }
    // })
    .then( results => {
      console.log('2:', results );
      // const { rows: books } = results
      // console.log('3:', books);
      response.render('books/search', { results })
    })
    .catch( error => response.send({ error, message: error.message }))
})

// Project.findAll({where: {title: {like: '%' + x + '%'}, id: {gt: 10}}).success(function(projects) {
//   for (var i=0; i<projects.length; i++) {
//     console.log(projects[i].title + " " + projects[i].description);
//   }
// });
module.exports = router
