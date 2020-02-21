# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
mens = Category.create(id: 1, name: "Men")
womens = Category.create(id: 2, name: "Women")
accessories = Category.create(id: 3, name: "Accessories")

sarah = Seller.create(id: 1, name: "Sarah")
ryan = Seller.create(id: 2, name: "Ryan")

dress = Item.create(id: 1, name: "Dress", description: "Lovely Spring dress", size: "4", price: 50.00, category_id: 2, seller_id: 1, image_url: "https://images.pexels.com/photos/985635/pexels-photo-985635.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940")
suit = Item.create(id: 2, name: "Suit", description: "Smart, business suit", size: "M", price: 135.00, category_id: 1, seller_id: 2, image_url: "https://images.pexels.com/photos/450212/pexels-photo-450212.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940")
