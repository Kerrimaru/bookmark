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
@bikes = Tag.create!(tag: 'bikes')
@birds = Tag.create!(tag: 'birds')
@poetry = Tag.create!(tag: 'poetry')
@flowers = Tag.create!(tag: 'flowers')
@belgian = Tag.create!(tag: 'belgian beer')
@canals = Tag.create!(tag: 'canals')
@a = Tag.create!(tag: 'art')
@b = Tag.create!(tag: 'music')
@c = Tag.create!(tag: 'avant garde')
@g = Tag.create!(tag: 'cats')
@f = Tag.create!(tag: 'loudness')
@e = Tag.create!(tag: 'quietness')
@d = Tag.create!(tag: 'dreams')


titles = [
  "it won’t suit me",
  "it was not the right thing to do",
  "stop playing poker",
  "any amount will be greatly appreciated",
  "perhaps compensates for the loss of a true metaphysics",
  "loud voice",
  "The waves were crashing on the shore",
  "it was a lovely sight",
  "I often see the time 11:11 or 12:34 on clocks",
  "come back at once",
  "I'd rather be a bird than a fish",
  "glittering gem",
  "Abstraction",
  "The sky is clear",
  "not noisy"
]

urls = [
  "www.modernpoetry.org.uk/blinks.html",
  "www.avantgardemusic.com",
  "https://webflow.com/blog/10-brutalist-websites",
  "https://filmquarterly.org/2009/09/01/the-avant-garde-archive-online",
  "www.modernpoetry.org.uk/blinks.html",
  "https://www.poetryfoundation.org/",
  "https://allpoetry.com/poems",
  "poetrysociety.org.uk/",
  "https://fleursdumal.org/",
  "https://www.hafizonlove.com/",
  "www.thesongsofhafiz.com/hafizpoetry.htm",
  "terminaliafestival.org",
  "https://mappingweirdstuff.wordpress.com",
  "surrealism.website",
  "www.surrealists.co.uk",
  "www.surrealismart.org/websites.html"
]




# Bookmark.all.each do |bookmark|
#   #bookmark.screenshot.attach(io: File.open('app/assets/images/tempScreen.png'), filename: 'tempScreen.png')
#   bookmark.screenshot.attach(io: File.open('app/assets/images/screens/defaultScreen.jpg'), filename: 'defaultScreen.jpg')
# end
@b2 = Bookmark.create!(url: 'http://blogpaws.com',title: 'blogpaws',user: @bella)
@b3 = Bookmark.create!(url: 'http://www.allthingsdogblog.com',title: 'dogggs',user: @bella)
@b5 = Bookmark.create!(url: 'http://www.bringingupbella.com',title: 'WARNING YOU SHOULD NOT SEE ME UNLESS YOU ARE VIK!!!!',user: @vik)
@b6 = Bookmark.create!(url: urls.sample, title: titles.sample, user: @bella)
@b7 = Bookmark.create!(url: urls.sample, title: titles.sample, user: @bella)
@b8 = Bookmark.create!(url: urls.sample, title: titles.sample, user: @bella)
@b9 = Bookmark.create!(url: urls.sample, title: titles.sample, user: @bella)
@b10 = Bookmark.create!(url: urls.sample, title: titles.sample, user: @bella)
@b11 = Bookmark.create!(url: urls.sample, title: titles.sample, user: @bella)
@b12 = Bookmark.create!(url: urls.sample, title: titles.sample, user: @bella)
@aa = Bookmark.create!(url: urls.sample, title: titles.sample, user: @bella)
@bb = Bookmark.create!(url: urls.sample, title: titles.sample, user: @bella)
@cc = Bookmark.create!(url: urls.sample, title: titles.sample, user: @bella)
@dd = Bookmark.create!(url: urls.sample, title: titles.sample, user: @bella)
@ee = Bookmark.create!(url: urls.sample, title: titles.sample, user: @bella)
@wegot = Bookmark.create!(url: 'https://www.wegotcoders.com/',title: '
We Got Coders | Web Development Courses & Developers For Hire',user: @bella)
@ff = Bookmark.create!(url: urls.sample, title: titles.sample, user: @bella)
@kk = Bookmark.create!(url: urls.sample, title: titles.sample, user: @bella)
@jj = Bookmark.create!(url: urls.sample, title: titles.sample, user: @bella)
@ii = Bookmark.create!(url: urls.sample, title: titles.sample, user: @bella)
@hh = Bookmark.create!(url: urls.sample, title: titles.sample, user: @bella)
@gg = Bookmark.create!(url: urls.sample, title: titles.sample, user: @bella)
@boxt = Bookmark.create!(url: 'https://boxt.co.uk/', title: 'Buy a Worcester Bosch boiler online with installation | BOXT.co.uk', user: @bella)
@b4 = Bookmark.create!(url: 'http://www.bringingupbella.com',title: 'A dog named bella!',user: @bella)
@kerrSite = Bookmark.create!(url: 'https://kerrimaru.github.io/#main',title: 'Really cool site!!',user: @bella)

Bookmark.all.each do |bookmark|
    x = Tag.all.shuffle
    random_tag = [x[0],x[1], x[2], x[3], x[4]]
    bookmark.tags << random_tag
end


@bb.screenshot.attach(io: File.open('app/assets/images/screens/dolelol.png'), filename: 'dolelol.png')
@cc.screenshot.attach(io: File.open('app/assets/images/screens/images.jfif'), filename: 'images.jfif')
@dd.screenshot.attach(io: File.open('app/assets/images/screens/scree5.png'), filename: 'scree5.png')
@ee.screenshot.attach(io: File.open('app/assets/images/screens/screen1.jpg'), filename: 'screen1.jpg')
@aa.screenshot.attach(io: File.open('app/assets/images/screens/defaultScreen.jpg'), filename: 'defaultScreen.jpg')
@ff.screenshot.attach(io: File.open('app/assets/images/screens/screen2.jfif'), filename: 'screen2.jfif')
@kk.screenshot.attach(io: File.open('app/assets/images/screens/screen3.png'), filename: 'screen3.png')
@jj.screenshot.attach(io: File.open('app/assets/images/screens/screen6.jfif'), filename: 'screen6.jfif')
@ii.screenshot.attach(io: File.open('app/assets/images/screens/screen7.jpg'), filename: 'screen7.jpg')
@hh.screenshot.attach(io: File.open('app/assets/images/screens/screen8.jpg'), filename: 'screen8.jpg')
@gg.screenshot.attach(io: File.open('app/assets/images/screens/yum.jpg'), filename: 'yum.jpg')
@b6.screenshot.attach(io: File.open('app/assets/images/screens/screen3.png'), filename: 'screen3.png')
@b7.screenshot.attach(io: File.open('app/assets/images/screens/dolelol.png'), filename: 'dolelol.png')
@b8.screenshot.attach(io: File.open('app/assets/images/screens/images.jfif'), filename: 'images.jfif')
@b9.screenshot.attach(io: File.open('app/assets/images/screens/screen2.jfif'), filename: 'screen2.jfif')
@b10.screenshot.attach(io: File.open('app/assets/images/screens/screen6.jfif'), filename: 'screen6.jfif')
@b11.screenshot.attach(io: File.open('app/assets/images/screens/screen1.jpg'), filename: 'screen1.jpg')
@b12.screenshot.attach(io: File.open('app/assets/images/screens/screen7.jpg'), filename: 'screen7.jpg')
@b4.screenshot.attach(io: File.open('app/assets/images/screens/scree5.png'), filename: 'scree5.png')
@kerrSite.screenshot.attach(io: File.open('app/assets/images/screens/kerri.jfif'), filename: 'kerri.jfif')
@wegot.screenshot.attach(io: File.open('app/assets/images/screens/coders.jfif'), filename: 'coders.jfif')
@boxt.screenshot.attach(io: File.open('app/assets/images/screens/boxt.jfif'), filename: 'boxt.jfif')
@b2.screenshot.attach(io: File.open('app/assets/images/screens/dolelol.png'), filename: 'dolelol.png')
@b3.screenshot.attach(io: File.open('app/assets/images/screens/images.jfif'), filename: 'images.jfif')
@b5.screenshot.attach(io: File.open('app/assets/images/screens/scree5.png'), filename: 'scree5.png')
