require 'open-uri'
require 'faker'

puts 'Cleaning database...'
Rental.destroy_all
Item.destroy_all
User.destroy_all

ADDRESS = [
  'Schweigaardsgate 34C, Oslo',
  'Karl Johans gate 34C, Oslo',
  'Paulus Plass 1C, Oslo',
  'Sofies Plass 3b, Oslo',
  'Akersgata 55, Oslo',
  'Lakkegata 32, Oslo',
  'Hertug Skules vei 6, Fredrikstad',
  'Henrik Ibsensgate 2, Oslo',
  'Akersbakken 2, Oslo',
  'Konowsgate 3, Oslo'
]

CATEGORIES = [
  'Drill',
  'Garden',
  'Saw',
  'Hammer',
  'Painting tool',
  'Electrical tool',
  'Screwdrivers',
  'Cleaning tool',
  'Accessories',
  'Hand tool'
]

PICTURES = [
  'https://images.unsplash.com/photo-1513467655676-561b7d489a88?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1581788604067-769a11325b0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  "https://images.unsplash.com/photo-1540103711724-ebf833bde8d1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1503789146722-cf137a3c0fea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1518709414768-a88981a4515d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1505855796860-aa05646cbf1f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1504148455328-c376907d081c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1513467655676-561b7d489a88?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1513467535987-fd81bc7d62f8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1517437702514-0bdaa494a0b9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1577372440262-d86980dc1d62?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1580402427914-a6cc60d7d44f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
]

# puts 'Creating 100 fake users...'

# 100.times do
#   file = URI.open('https://picsum.photos/600')

#   user = User.new(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     address: ADDRESS.sample,
#     email: Faker::Internet.email,
#     password: '123456',
#     phone_number: Faker::PhoneNumber.cell_phone
#   )

#   user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
#   user.save!
# end

puts 'Creating users...'
users_attributes = [
  {
    first_name: 'Alex',
    last_name: 'Johnson',
    address: 'Schweigaardsgate 34C, Oslo',
    email: 'alex@gmail.com',
    password: '123456',
    phone_number: '47095092'
  },
  {
    first_name: 'Doris',
    last_name: 'Day',
    address: 'Karl Johans gate 34C, Oslo',
    email: 'doris@gmail.com',
    password: '123456',
    phone_number: '90028935'
  },
  {
    first_name: 'Jan',
    last_name: 'Olsen',
    address: 'Paulus Plass 1C, Oslo',
    email: 'jan@gmail.com',
    password: '123456',
    phone_number: '90023550'
  },
  {
    first_name: 'Joanna',
    last_name: 'Jansson',
    address: 'Sofies Plass 3b, Oslo',
    email: 'joanna@gmail.com',
    password: '123456',
    phone_number: '99281054'
  },
  {
    first_name: 'Flo',
    last_name: 'Jackson',
    address: 'Akersgata 55, Oslo',
    email: 'flo@gmail.com',
    password: '123456',
    phone_number: '41541450',
  },
]
User.create!(users_attributes)


puts 'Creating tools...'

25.times do

  file = URI.open(PICTURES.sample)

  item = Item.new(
    name: Faker::Commerce.product_name,
    description: Faker::Hipster.paragraphs(number: 2).join(" "),
    price: rand(50..300),
    user_id: rand(1..5),
    category: CATEGORIES.sample
  )

  item.photo.attach(io: file, filename: "#{Faker::Commerce.product_name}.png", content_type: 'image/png')
  item.save!
end

# tools_attributes = [
#   {
#     name: 'Bosch drill',
#     description: 'Måleverktøyene fra Bosch er svært nøyaktige og enkle å bruke. Robustheten garanterer nøyaktige resultater med de digitale måleverktøyene også i hverdagen på byggeplassen – enten det gjelder nivellering, måling av avstander, vinkler og helninger eller ved lokalisering av forskjellige materialer og ledninger.',
#     price: '159',
#     user_id: 1,
#     category: 'drill'
#   },
#   {
#     name: 'DeWalt saw',
#     description: 'Måleverktøyene fra Bosch er svært nøyaktige og enkle å bruke. Robustheten garanterer nøyaktige resultater med de digitale måleverktøyene også i hverdagen på byggeplassen – enten det gjelder nivellering, måling av avstander, vinkler og helninger eller ved lokalisering av forskjellige materialer og ledninger.',
#     price: '300',
#     user_id: 2,
#     category: 'saw'
#   },
#   {
#     name: 'Garden shuffle',
#     description: 'Måleverktøyene fra Bosch er svært nøyaktige og enkle å bruke. Robustheten garanterer nøyaktige resultater med de digitale måleverktøyene også i hverdagen på byggeplassen – enten det gjelder nivellering, måling av avstander, vinkler og helninger eller ved lokalisering av forskjellige materialer og ledninger.',
#     price: '80',
#     user_id: 3,
#     category: 'garden'
#   },

# ]
# Item.create!(tools_attributes)

# Item.all.each do |tool|
#   tool.photo.attach(io: file, filename: 'tool.png', content_type: 'image/png')
#   tool.save
# end


puts 'Creating rentals...'
rental_attributes = [
  {
    item_id: 1,
    user_id: 2,
    start_date: Date.today,
    end_date: Date.today
  },
    {
    item_id: 2,
    user_id: 1,
    start_date: Date.today,
    end_date: Date.today
  },
    {
    item_id: 3,
    user_id: 2,
    start_date: Date.today,
    end_date: Date.today
  }
]
Rental.create!(rental_attributes)


puts 'Finished!'
