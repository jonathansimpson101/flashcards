puts "Resetting database..."
Deck.destroy_all
Category.destroy_all
User.destroy_all

# Seeding users
puts 'Seeding Users'
users = []
10.times do
  user = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "123456")
  users << user
  user.save
end

# Seeding categories
puts "Seeding Categories"
front_end = Category.create!(name: "Front End")
back_end = Category.create!(name: "Back End")




# Seeding decks
puts "Seeding decks"
html = Deck.new(name:"HTML", category_id:front_end.id, user_id:users.sample.id)
html.save
css = Deck.new(name:"CSS", category_id:front_end.id, user_id:users.sample.id)
css.save
javascript = Deck.new(name:"Javascript", category_id:front_end.id, user_id:users.sample.id)
javascript.save
ruby = Deck.new(name:"Ruby", category_id:back_end.id, user_id:users.sample.id)
ruby.save
rails = Deck.new(name:"Rails", category_id:back_end.id, user_id:users.sample.id)
rails.save
sql = Deck.new(name:"SQL", category_id:back_end.id, user_id:users.sample.id)
sql.save

# Seeding cards
card1 = Card.new(question: "Where do you write the attributes for a HTML element?",
                 attempt: "",
                 answer: "In the opening tag",
                 # deck_id:html.id
                 )



puts "Done!"
