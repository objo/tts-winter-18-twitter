# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

SOURCE = [ Faker::Seinfeld, Faker::StarWars, Faker::HarryPotter ]

def create_messages(u)
  u.tweets.destroy_all
  puts "Creating tweets"
  20.times do 
    putc '.'
    u.tweets.create!(
      message: SOURCE.sample.quote.truncate(140), 
      created_at: Faker::Date.between(2.months.ago, Time.now)
    )
  end
end
  

User.destroy_all

u = User.create!(
  first_name: "Joe",
  last_name:  "O'Brien",
  email: 'joe@objo.com',
  password: '12345678',
  password_confirmation: '12345678',
  username: "objo",
  bio: "Lorem ipsum dolnthor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  city: "Westerville", 
  state: "Ohio",
)

create_messages(u)

20.times do |iteration|

  u = User.create!(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'dont care',
    password_confirmation: 'dont care',
    username: Faker::Internet.user_name(5..10),
    bio: Faker::Lorem.sentences(4).join(" "),
    city: Faker::Address.city, 
    state: Faker::Address.state_abbr,
  )
  
  u.avatar = Rails.root.join("app/assets/images/stock-profile-#{iteration + 1}.jpeg").open
  
  create_messages(u)
  
  u.save!
end

puts "done"


  
  
  
  
  
  
  
  
  
  
  









