require "open-uri"


puts "Resetting database..."
Topic.destroy_all
Card.destroy_all
Deck.destroy_all
Category.destroy_all
User.destroy_all


avatar_images = ["https://images.ctfassets.net/1wryd5vd9xez/4DxzhQY7WFsbtTkoYntq23/a4a04701649e92a929010a6a860b66bf/https___cdn-images-1.medium.com_max_2000_1_Y6l_FDhxOI1AhjL56dHh8g.jpeg",
"https://alzheimer.ca/sites/default/files/styles/hero/public/2020-09/National-ambassador-Jane-Kennedy.jpg?itok=etAp5n27",
"https://mk0qomafemocnned3wjh.kinstacdn.com/wp-content/uploads/2019/02/AI-thispersondoesnotexist.jpg",
"https://i2.wp.com/therighthairstyles.com/wp-content/uploads/2014/03/8-choppy-collarbone-cut.jpg?resize=500%2C500&ssl=1",
"https://i0.wp.com/www.hadviser.com/wp-content/uploads/2019/04/24-shaggy-bob-for-square-face-BcKy3nOnaAm.jpg?resize=995%2C995&ssl=1",
"https://cdn.lifehack.org/wp-content/uploads/2014/03/shutterstock_97566446.jpg",
"https://grademiners.com/wp-content/uploads/2017/07/Descriptive-Essay-About-a-Person.jpg",
"https://img.buzzfeed.com/buzzfeed-static/static/2016-07/7/5/enhanced/buzzfeed-prod-fastlane01/original-grid-image-13357-1467884354-3.jpg?crop=1024:1024;0,0",
"https://img.buzzfeed.com/buzzfeed-static/static/2016-07/7/5/enhanced/buzzfeed-prod-fastlane01/original-grid-image-13974-1467884399-11.jpg?crop=1024:1024;0,0"]

# Seeding users
puts 'Seeding Users'
users = []

#initialise counter
i=0

10.times do
  user = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "123456")
  puts "uploading image #{i}"
  file = URI.open("#{avatar_images[i]}")
  user.avatar.attach(io: file, filename: 'person.jpg', content_type: 'image/jpg')
  users << user
  user.save
  i+=1
end

# Seeding user for demos
puts "Seeding user for demos. Email: 'demo@gmail.com', Password: 123456, First Name: 'Jonathan', Last Name: Simpson"
demo_user = User.new(first_name: "Jonathan", last_name: "Simpson", email: "demo@gmail.com", password: "123456")
demo_user.save!

# Seeding categories
puts "Seeding Categories"
front_end = Category.create!(name: "Front End")
back_end = Category.create!(name: "Back End")
ajax = Category.create!(name: "Ajax")
authenticating_users = Category.create!(name: "Authenticating Users")
searching_database = Category.create!(name: "Searching Databases")
github = Category.create!(name: "Github")


# Seeding decks
puts "Seeding Decks"
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

# Seeding decks for demo user
puts "Seeding decks for demo user"
advanced_routing = Deck.new(name:"Advanced Routing", category_id:back_end.id, user_id:demo_user.id)
advanced_routing.save!

dom_manipulation = Deck.new(name:"DOM Manipulation", category_id:front_end.id, user_id:demo_user.id)
dom_manipulation.save!

db = Deck.new(name:"Migrations", category_id:back_end.id, user_id:demo_user.id)
db.save!

heroku = Deck.new(name:"Heroku", category_id:back_end.id, user_id:demo_user.id)
heroku.save!

# Seeding cards
puts "Seeding Cards"
card1 = Card.new(question: "What are the roles of HTML tags?",
                 answer: "HTML tags tell browsers what kind of content they should display. Browsers read each tag and implement its associated default style",
                 )
card1.save!

card2 = Card.new(question: "How do you emphasize a word in a paragraph?",
                 answer: "You can both use <em> or <strong> tags, surrounding the text you wish to emphasize",
                 )
card2.save!

card3 = Card.new(question: "Which HTML element is generally used to hold other elements?",
                 answer: "<div> tags",
                 )
card3.save!

card4 = Card.new(question: "How do you add a blockquote in HTML?",
                 answer: "<blockquote> </blockquote>",
                 )
card4.save!

card5 = Card.new(question: "What does the action attribute do in a form?",
                 answer: "Gives the URL for where the form is to be submitted",
                 )
card5.save!

card6 = Card.new(question: "What is a form in HTML for?",
                 answer: "It accept some information from the user and submits it via a HTTP to the server",
                 )
card6.save!

card7 = Card.new(question: "Where in your HTML document should the script tags be?",
                 answer: "At the bottom of the body",
                 )
card7.save!

card8 = Card.new(question: "In which section of the HTML file is the link to the stylesheet placed?",
                 answer: "The head.",
                 )
card8.save!

card9 = Card.new(question: "What does HTML stand for?",
                 answer: "Hyper Text Markup Language",
                 )
card9.save!

card10 = Card.new(question: "What does CSS stand for?",
                 answer: "Cascading Style Sheets!",
                 )
card10.save!

card11 = Card.new(question: "What is the required syntax to add a box shadow to a div in CSS?",
                 answer: "'box-shadow: 1px 1px 2px black;' --> Where the first two arguments position the box shadow, the third one defines the amount of blur and the final argument defines the colour",
                 )
card11.save!

card12 = Card.new(question: "How do you define a div as a flexbox in your CSS?",
                 answer: "By applying to your div the CSS property, display: flex; property",
                 )
card12.save!

card13 = Card.new(question: "What is the box model and what 4 dimension properties make up the box model?",
                 answer: "The box model defines the CSS dimension properties of an HTML element. The 4 dimensions are: margin, border, padding and content",
                 )
card13.save!

card14 = Card.new(question: "State the five available arguments for justify-position in Flexbox",
                 answer: "start, center, end, space-around and space-between.",
                 )
card14.save!

card15 = Card.new(question: "1) In CSS, what syntax defines a CSS component as a CSS id, 2) What is a CSS id, 3) Why is it useful?",
                 answer: "1) Syntax requires #, 2) A CSS id is an HTML attribute used to define specific CSS properties to a unique element, 3) It is useful as it applies to only one specific HTML element",
                 )
card15.save!

card16 = Card.new(question: "Write the line of code to add a 3px solid blue border to a div",
                 answer: "border: 3px solid blue;",
                 )
card16.save!

card17 = Card.new(question: "What does AJAX stand for?",
                 answer: "Asynchronous Javascript and XML",
                 )
card17.save!

card18 = Card.new(question: "Which Javascript function is used to find an element in the DOM?",
                 answer: "document.querySelector()",
                 )
card18.save!

card19 = Card.new(question: "How do you store a value in a brand new variable in JS??",
                 answer: "You need to use one of the const or let keywords, then afterwards assign VARIABLE_NAME = VARIABLE_VALUE",
                 )
card19.save!

card20 = Card.new(question: "Whats the difference between a const and let variable?",
                 answer: "const defines a variable whose value will not be re-assigned whereas a let variable can be re-assigned (important for iterations as let can be assigned as the 'count' to break the loop)",
                 )
card20.save!

card21 = Card.new(question: "How do you interpolate a string in Javascript?",
                 answer: "by using '${ }'",
                 )
card21.save!

card22 = Card.new(question: "Which array method would you use to select only the elements which meet a certain condition?",
                 answer: ".select",
                 )
card22.save!

card23 = Card.new(question: "Write out a line of code which takes a string and reverses the order of the characters",
                 answer: "string.reverse",
                 )
card23.save!

card24 = Card.new(question: "What is a variable? How do you use them?",
                 answer: "A variable is like a container, you can put anything you want in it by assigning values to them using an '='",
                 )
card24.save!

card25 = Card.new(question: "What method can you call on an object to determine its type (String, Integer, Array…)?",
                 answer: ".class method",
                 )
card25.save!

card26 = Card.new(question: "What is the main difference between single quotes '' and double quotes ""?",
                 answer: "You can only interpolate between double quotes --> " '#{ }' "",
                 )
card26.save!

card27 = Card.new(question: "Write the command to generate a migration file to add a column to a table:",
                 answer: "rails g migration AddColumnToTable column:column_type",
                 )
card27.save!

card28 = Card.new(question: "If no database type is specified, which type will Rails use by default?",
                 answer: "sqlite",
                 )
card28.save!

card29 = Card.new(question: "Whats is command do you run in terminal to: 1) drop the database, 2) creat an empty database, 3) run pending migrations into the database and 4) run seeds.rb file?",
                 answer: "1) Rails db:drop, 2) Rails db:create, 3) Rails db:migrate, 4) Rails db:seed",
                 )
card29.save!

card30 = Card.new(question: "List the 7 CRUD actions:",
                 answer: "index, show, new, create, edit, update and destroy",
                 )
card30.save!

card31 = Card.new(question: "How do you build the path to a page of a Rails app?",
                 answer: "Run rails routes in terminal",
                 )
card31.save!

card32 = Card.new(question: "Which Active Record method retrieves all instances of a model from the database?",
                 answer: "Model.all",
                 )
card32.save!

card33 = Card.new(question: "Which placeholder is used in SQL to reprensent all columns in a table?",
                 answer: "*",
                 )
card33.save!

card34 = Card.new(question: "It’s Dr House's birthday. What SQL query would you execute to update his age to its new value 32 knowing his id is 3?",
                 answer: "UPDATE doctors SET age = 42 WHERE id = 3;",
                 )
card34.save!

card35 = Card.new(question: "Whose responsibility is it to set the id of a new model instance?",
                 answer: "It’s the DB’s responsibility. Every DB manages the id’s autoincrement",
                 )
card35.save!

card36 = Card.new(question: "In a DB with a students table, write an SQL query to get the number of students by age groups?",
                 answer: "SELECT COUNT(*), age FROM students, GROUP BY age;",
                 )
card36.save!

# Seeding topics
puts "Seeding Topics"
Topic.create!(card_id: card1.id, deck_id: html.id)
Topic.create!(card_id: card2.id, deck_id: html.id)
Topic.create!(card_id: card3.id, deck_id: html.id)
Topic.create!(card_id: card4.id, deck_id: html.id)
Topic.create!(card_id: card5.id, deck_id: html.id)
Topic.create!(card_id: card6.id, deck_id: html.id)
Topic.create!(card_id: card7.id, deck_id: html.id)
Topic.create!(card_id: card8.id, deck_id: html.id)
Topic.create!(card_id: card9.id, deck_id: html.id)
Topic.create!(card_id: card10.id, deck_id: css.id)
Topic.create!(card_id: card11.id, deck_id: css.id)
Topic.create!(card_id: card12.id, deck_id: css.id)
Topic.create!(card_id: card13.id, deck_id: css.id)
Topic.create!(card_id: card14.id, deck_id: css.id)
Topic.create!(card_id: card15.id, deck_id: css.id)
Topic.create!(card_id: card16.id, deck_id: css.id)
Topic.create!(card_id: card17.id, deck_id: javascript.id)
Topic.create!(card_id: card18.id, deck_id: javascript.id)
Topic.create!(card_id: card19.id, deck_id: javascript.id)
Topic.create!(card_id: card20.id, deck_id: javascript.id)
Topic.create!(card_id: card21.id, deck_id: javascript.id)
Topic.create!(card_id: card22.id, deck_id: ruby.id)
Topic.create!(card_id: card23.id, deck_id: ruby.id)
Topic.create!(card_id: card24.id, deck_id: ruby.id)
Topic.create!(card_id: card25.id, deck_id: ruby.id)
Topic.create!(card_id: card26.id, deck_id: ruby.id)
Topic.create!(card_id: card27.id, deck_id: rails.id)
Topic.create!(card_id: card28.id, deck_id: rails.id)
Topic.create!(card_id: card29.id, deck_id: rails.id)
Topic.create!(card_id: card30.id, deck_id: rails.id)
Topic.create!(card_id: card31.id, deck_id: rails.id)
Topic.create!(card_id: card32.id, deck_id: sql.id)
Topic.create!(card_id: card33.id, deck_id: sql.id)
Topic.create!(card_id: card34.id, deck_id: sql.id)
Topic.create!(card_id: card35.id, deck_id: sql.id)
Topic.create!(card_id: card36.id, deck_id: sql.id)

puts "Done!"
