DROP TABLE IF EXISTS books;

CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description VARCHAR(255),
  cover VARCHAR(255)
);

DROP TABLE IF EXISTS authors;

CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS book_authors;

CREATE TABLE book_authors (
  book_id INTEGER NOT NULL,
  author_id INTEGER NOT NULL
);

DROP TABLE IF EXISTS genres;

CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS book_genres;

CREATE TABLE book_genres (
  book_id INTEGER NOT NULL,
  genre_id INTEGER NOT NULL
);

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS available;

CREATE TABLE available (
  id SERIAL PRIMARY KEY,
  book_id INTEGER NOT NULL,
  borrow_id INTEGER
);

DROP TABLE IF EXISTS borrow;

CREATE TABLE borrow (
  user_id INTEGER NOT NULL,
  available_id INTEGER NOT NULL,
  checkout_date DATE NOT NULL,
  due_date DATE NOT NULL,
  return_date DATE NOT NULL,
  return BOOLEAN NOT NULL
);
