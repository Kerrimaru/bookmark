# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@bella = User.create!(email: 'bella@dog.com', password: 'pass123')
@vik = User.create!(email: 'vik@dog.com', password: 'pass123')
@bunny = User.create!(email: 'bunbun@dog.com', password: 'pass123')

@bella.bookmarks.create!(
  url: 'https://kerrimaru.github.io/#main',
  screenshot: 'tempScreen.png',
  title: 'Really cool site!!'
)

@bella.bookmarks.create!(
  url: 'http://blogpaws.com',
  screenshot: 'tempScreen.png',
  title: 'blogpaws'
)

@bella.bookmarks.create!(
  url: 'http://www.allthingsdogblog.com',
  screenshot: 'tempScreen.png',
  title: 'dogggs'
)

@bella.bookmarks.create!(
  url: 'http://www.bringingupbella.com',
  screenshot: 'tempScreen.png',
  title: 'A dog named bella!'
)
# Bookmark.create!(
#   user: @bella,
#   url: 'https://kerrimaru.github.io/#main',
#   screenshot: '/app/assets/images/tempScreen.png',
#   title: 'cool site'
# )