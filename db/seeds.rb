# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

LineItem.destroy_all
Product.destroy_all

prod1 = cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 10,
  price: 64.99
})

prod2 = cat1.products.create!({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
})

prod3 = cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 4,
  price: 34.49
})

cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
})

cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 8,
  price: 1_225.00
})

cat1.products.create!({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
})


cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 0,
  price: 164.49
})

cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 3,
  price: 26.00
})

cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 32,
  price: 2_026.29
})

cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
})

cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 2,
  price: 987.65
})

cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  quantity: 0,
  price: 2_483.75
})

## USERS

User.destroy_all

user1 = User.create!({
  first_name: 'Ruby',
  last_name: 'Gem',
  email: 'ruby.gem@gmail.com',
  password: '123',
  password_confirmation: '123'
  })

user2 = User.create!({
  first_name: 'Avi',
  last_name: 'Sings',
  email: 'Avi@gmail.com',
  password: '123',
  password_confirmation: '123'
  })

user3 = User.create!({
  first_name: 'Bob',
  last_name: 'Marley',
  email: 'iamcool@gmail.com',
  password: '123',
  password_confirmation: '123'
  })

user4 = User.create!({
  first_name: 'Mahatma',
  last_name: 'Gandhi',
  email: 'peace@gmail.com',
  password: '123',
  password_confirmation: '123'
  })

user5 = User.create!({
  first_name: 'Mary',
  last_name: 'Poppins',
  email: 'Supercalafajalistickexpialadojus@gmail.com',
  password: '123',
  password_confirmation: '123'
  })



## LINE ITEMS

line_item1 = LineItem.create({
  product: prod1,
  quantity: 1,
  item_price_cents: 1234,
  total_price_cents: 3000
  })

line_item2 = LineItem.create({

  product: prod2,
  quantity: 2,
  item_price_cents: 4500,
  total_price_cents: 9000
  })

line_item3 = LineItem.create({

  product: prod3,
  quantity: 1,
  item_price_cents: 3000,
  total_price_cents: 3000
  })

line_item4 = LineItem.create({

  product: prod1,
  quantity: 1,
  item_price_cents: 2100,
  total_price_cents: 2100
  })

## ORDERS

user1.orders.create!({
  line_items: [line_item1],
  total_cents: 3000,
  stripe_charge_id: 12345,
  email: 'ruby.gem@gmail.com',
  user_id: 1
  })

user2.orders.create!({
  line_items: [line_item1],
  total_cents: 3000,
  stripe_charge_id: 12345,
  email: 'Avi@gmail.com',
  user_id: 2
  })

user3.orders.create!({
  line_items: [line_item1],
  total_cents: 3000,
  stripe_charge_id: 12345,
  email: 'iamcool@gmail.com',
  user_id: 3
  })

user4.orders.create!({
  line_items: [line_item1],
  total_cents: 3000,
  stripe_charge_id: 12345,
  email: 'peace@gmail.com',
  user_id: 4
  })

user5.orders.create!({
  line_items: [line_item1],
  total_cents: 3000,
  stripe_charge_id: 12345,
  email: 'Supercalafajalistickexpialadojus@gmail.com',
  user_id: 5
  })

#REVIEWS

puts "Re-creating Reviews ..."

Review.destroy_all

Review.create!({
  user: User.first,
  product: Product.second,
  rating: 5,
  description: 'Curious....very Curious!!'
})

Review.create!({
  user: User.second,
  product: Product.first,
  rating: 1,
  description: 'Dear god why?'
})

Review.create!({
  user: User.first,
  product: Product.first,
  rating: 3,
  description: 'Dude yess'
})

Review.create!({
  user: User.third,
  product: Product.last,
  rating: 5,
  description: 'LOVE this?'
})

Review.create!({
  user: User.fourth,
  product: Product.fourth,
  rating: 2,
  description: 'I am not sure why I bought this'
})

Review.create!({
  user: User.second,
  product: Product.fifth,
  rating: 4,
  description: 'this made my day!'
})

puts "DONE!"
