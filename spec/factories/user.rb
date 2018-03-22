FactoryBot.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name  Faker::Name.last_name
    email      Faker::Internet.email
    username   Faker::Internet.user_name(5..10)
    bio        Faker::Lorem.sentences(4).join(" ")
    city       Faker::Address.city
    state      Faker::Address.state_abbr
    
    new_password = '12345678'
    password new_password
    password_confirmation new_password
  end
end