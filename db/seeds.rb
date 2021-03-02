puts "Resetting database..."
Topic.destroy_all
Card.destroy_all
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
html.save!
css = Deck.new(name:"CSS", category_id:front_end.id, user_id:users.sample.id)
css.save!
javascript = Deck.new(name:"Javascript", category_id:front_end.id, user_id:users.sample.id)
javascript.save!
ruby = Deck.new(name:"Ruby", category_id:back_end.id, user_id:users.sample.id)
ruby.save
rails = Deck.new(name:"Rails", category_id:back_end.id, user_id:users.sample.id)
rails.save!
sql = Deck.new(name:"SQL", category_id:back_end.id, user_id:users.sample.id)
sql.save!

# Seeding cards
puts "Seeding cards"
card1 = Card.new(question: "Where do you write the attributes for a HTML element?",
                 attempt: "-",
                 answer: "In the opening tag",
                 )
card1.save!

card2 = Card.new(question: "What does CSS stand for?",
                 attempt: "-",
                 answer: "Cascading Style Sheets",
                 )
card2.save!

card3 = Card.new(question: "What does AJAX stand for?",
                 attempt: "-",
                 answer: "Asynchronous Javascript and XML",
                 )
card3.save!

card4 = Card.new(question: "Which array method would you use to select only the elements which meet a certain condition?",
                 attempt: "-",
                 answer: ".select",
                 )
card4.save!

card5 = Card.new(question: "Write the command to generate a migration file to add a column to a table",
                 attempt: "-",
                 answer: "rails g migration AddColumnToTable column:column_type",
                 )
card5.save!

card6 = Card.new(question: "Which Active Record method retrieves all instances of a model from the database?",
                 attempt: "-",
                 answer: "Model.all",
                 )
card6.save!

card7 = Card.new(question: "In which section of the HTML file is the link to the stylesheet placed?",
                 attempt: "-",
                 answer: "The head.",
                 )
card7.save!

card8 = Card.new(question: "Write the line of code to add a 3px solid blue border to a div",
                 attempt: "-",
                 answer: "border: 3px solid blue;",
                 )
card8.save!

card9 = Card.new(question: "Which Javascript function is used to find an element in the DOM?",
                 attempt: "-",
                 answer: "document.querySelector()",
                 )
card9.save!

card10 = Card.new(question: "Write out a line of code which takes a string and reverses the order of the characters.",
                 attempt: "-",
                 answer: "string.reverse",
                 )
card10.save!

card11 = Card.new(question: "If no database type is specified, which type will Rails use by default?",
                 attempt: "-",
                 answer: "sqlite",
                 )
card11.save!

card12 = Card.new(question: "Which placeholder is used in SQL to reprensent all columns in a table?",
                 attempt: "-",
                 answer: "*",
                 )
card12.save!

# Seeding topics
puts "Seeding topics"
Topic.create!(card_id: card1.id, deck_id: html.id)
Topic.create!(card_id: card2.id, deck_id: css.id)
Topic.create!(card_id: card3.id, deck_id: javascript.id)
Topic.create!(card_id: card4.id, deck_id: ruby.id)
Topic.create!(card_id: card5.id, deck_id: rails.id)
Topic.create!(card_id: card6.id, deck_id: sql.id)

Topic.create!(card_id: card7.id, deck_id: html.id)
Topic.create!(card_id: card8.id, deck_id: css.id)
Topic.create!(card_id: card9.id, deck_id: javascript.id)
Topic.create!(card_id: card10.id, deck_id: ruby.id)
Topic.create!(card_id: card11.id, deck_id: rails.id)
Topic.create!(card_id: card12.id, deck_id: sql.id)


puts "Done!"
