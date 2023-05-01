// CS 3810: Principles of Database Systems
// Homework 10: The books database
// Instructor: Thyago Mota
// Student: Nathan Mead

// db creation
use books;

db.books.insertOne({
  isbn: '1933988673',
  title: 'Unlocking Android',
  author: 'Charlie Collins',
  date: { year: 2009, month: 4 },
  pages: 250, 
  genres: ['technical']
});

db.books.insertOne({
  isbn: '1935182722',
  title: 'Android in Action, Second Edition',
  author: 'Robi Sen',
  date: { year: 2011, month: 1 },
  pages: 120, 
  genres: ['technical', 'programming']
});

db.books.insertOne({
  isbn: '1617290084',
  title: 'Specification by Example',
  author: 'Gojko Adzic',
  date: { year: 2011, month: 6 },
  pages: 840, 
  genres: ['technical', 'software engineering']
});

db.books.insertOne({
  isbn: '1933988797',
  title: 'Flex on Java',
  author: 'Andres Almiray',
  date: { year: 2010, month: 10 },
  pages: 95, 
  genres: ['technical', 'programming']
});

db.books.insertOne({
  isbn: '1617291609',
  title: 'MongoDB in Action',
  author: 'Kyle Banker',
  date: { year: 2012, month: 5 },
  pages: 350, 
  genres: ['technical', 'databases']
});

// list all books titles only (excluding _id)
db.books.find({}, {title: 1, _id: 0});

// list all books written by 'Kyle Banker'
db.books.find({author: 'Kyle Banker'});

// list all books published in 2011
db.books.find({'date.year': 2011});

// list the number of books per year sorted by year
db.books.aggregate([
  {$group: {_id: '$date.year', count: {$sum: 1}}},
  {$sort: {_id: 1}}
]);

// list all books that have more than 100 pages but less than 500 pages
db.books.find({pages: {$gt: 100, $lt: 500}});

// bonus: list the average number of pages of books per genre
db.books.aggregate([
  {$group: {_id: '$genres', avgPages: { $avg: '$pages' }}}]);
