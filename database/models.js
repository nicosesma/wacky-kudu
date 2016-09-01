const Sequelize = require( 'sequelize' )
const sequelize = new Sequelize(
  `postgres://${process.env.USER}@localhost:5432/siono`
)

const User = sequelize.define( 'user', {
  id: { type: Sequelize.INTEGER, primaryKey: true, autoIncrement: true },
  username: Sequelize.STRING,
  email: Sequelize.STRING,
  password: Sequelize.STRING
})

const Book = sequelize.define( 'book', {
  id: { type: Sequelize.INTEGER, primaryKey: true, autoIncrement: true },
  title: Sequelize.STRING,
  description: Sequelize.STRING,
  cover: Sequelize.STRING
})

const Available = sequelize.define( 'available', {
  id: { type: Sequelize.INTEGER, primaryKey: true, autoIncrement: true }
})

const Borrow = sequelize.define( 'borrow', {
  id: { type: Sequelize.INTEGER, primaryKey: true, autoIncrement: true },
  returned_on: { type: Sequelize.DATE },
  returned: { type: Sequelize.BOOLEAN },
  due_date: { type: Sequelize.DATE }
})

const Author = sequelize.define( 'author', {
  id: { type: Sequelize.INTEGER, primaryKey: true, autoIncrement: true },
  name: Sequelize.STRING
})

const Genre = sequelize.define( 'genre', {
  id: { type: Sequelize.INTEGER, primaryKey: true, autoIncrement: true },
  name: Sequelize.STRING
})

Available.belongsTo( Borrow, { as: 'borrow', constraints: false } )
Available.belongsTo( Book )
Borrow.belongsTo( Available )
Borrow.belongsTo( User )
Author.belongsToMany( Book, { through: 'bookAuthors' } )
Genre.belongsToMany( Book, { through: 'bookGenres' } )
Book.belongsToMany( Author, { through: 'bookAuthors' } )
Book.belongsToMany( Genre, { through: 'bookGenres' } )

sequelize.sync()

module.exports = { User, Book, Available, Borrow, Author, Genre }
