puts 'Cleaning database...'
Rental.destroy_all
Item.destroy_all
User.destroy_all

puts 'Creating users...'




puts 'Finished!'
