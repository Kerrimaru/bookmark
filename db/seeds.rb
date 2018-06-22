# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@bella = User.create!(email: 'bella@dog.com', password: 'pass123', name: 'Bella')
@vik = User.create!(email: 'vik@dog.com', password: 'pass123', name: 'Vik')
@bunny = User.create!(email: 'bunbun@dog.com', password: 'pass123', name: 'BunBun')

@dog = Tag.create!(tag: 'dog')
@cute = Tag.create!(tag: 'cute')
@fluffy = Tag.create!(tag: 'fluffy')
@coding = Tag.create!(tag: 'coding')
@bad = Tag.create!(tag: 'BAD TAG DONT SEE ME!!!!')


@b1 = Bookmark.create!(
  url: 'https://kerrimaru.github.io/#main',
  #screenshot: 'tempScreen.png',
  title: 'Really cool site!!',
  user: @bella,
  tags: [@fluffy, @dog, @cute, @coding]
)

@b2 = Bookmark.create!(
  url: 'http://blogpaws.com',
  #screenshot: 'tempScreen.png',
  title: 'blogpaws',
  user: @bella,
  tags: [@cute]
)

@b3 = Bookmark.create!(
  url: 'http://www.allthingsdogblog.com',
  #screenshot: 'tempScreen.png',
  title: 'dogggs',
  user: @bella,
  tags: [@dog, @cute]
)

@b4 = Bookmark.create!(
  url: 'http://www.bringingupbella.com',
  #screenshot: 'tempScreen.png',
  title: 'A dog named bella!',
  user: @bella,
  tags: [@fluffy, @dog]
)

@b5 = Bookmark.create!(
  url: 'http://www.bringingupbella.com',
  #screenshot: 'tempScreen.png',
  title: 'WARNING YOU SHOULD NOT SEE ME UNLESS YOU ARE VIK!!!!',
  user: @vik,
  tags: [@coding]
)

@b1.screenshot.attach(io: File.open('app/assets/images/tempScreen.png'), filename: 'tempScreen.png')
@b2.screenshot.attach(io: File.open('app/assets/images/tempScreen.png'), filename: 'tempScreen.png')
@b3.screenshot.attach(io: File.open('app/assets/images/tempScreen.png'), filename: 'tempScreen.png')
@b4.screenshot.attach(io: File.open('app/assets/images/tempScreen.png'), filename: 'tempScreen.png')
@b5.screenshot.attach(io: File.open('app/assets/images/tempScreen.png'), filename: 'tempScreen.png')




# Bookmark.create!(
#   user: @bella,
#   url: 'https://kerrimaru.github.io/#main',
#   screenshot: '/app/assets/images/tempScreen.png',
#   title: 'cool site'
# )