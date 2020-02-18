puts 'Cleaning database...'
Rental.destroy_all
Item.destroy_all
User.destroy_all

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
tools_attributes = [
  {
    name: 'Bosch drill',
    description: 'Måleverktøyene fra Bosch er svært nøyaktige og enkle å bruke. Robustheten garanterer nøyaktige resultater med de digitale måleverktøyene også i hverdagen på byggeplassen – enten det gjelder nivellering, måling av avstander, vinkler og helninger eller ved lokalisering av forskjellige materialer og ledninger.',
    price: '159',
    user_id: 1,
    category: 'drill'
  },
  {
    name: 'DeWalt saw',
    description: 'Måleverktøyene fra Bosch er svært nøyaktige og enkle å bruke. Robustheten garanterer nøyaktige resultater med de digitale måleverktøyene også i hverdagen på byggeplassen – enten det gjelder nivellering, måling av avstander, vinkler og helninger eller ved lokalisering av forskjellige materialer og ledninger.',
    price: '300',
    user_id: 2,
    category: 'saw'
  },
  {
    name: 'Garden shuffle',
    description: 'Måleverktøyene fra Bosch er svært nøyaktige og enkle å bruke. Robustheten garanterer nøyaktige resultater med de digitale måleverktøyene også i hverdagen på byggeplassen – enten det gjelder nivellering, måling av avstander, vinkler og helninger eller ved lokalisering av forskjellige materialer og ledninger.',
    price: '80',
    user_id: 3,
    category: 'garden'
  },

]
Item.create!(tools_attributes)

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
