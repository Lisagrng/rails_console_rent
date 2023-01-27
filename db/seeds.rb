# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Booking.destroy_all
Console.destroy_all
User.destroy_all

users = []
10.times do |i|
  @user = User.create(email: "lisa_#{i}@lisa.com", password: '123456')
  users << @user
end

Console.create!(name: "PS1", year: 1994, description: 'old console, good status', user: @user, price_per_day: 7,
                address: "Grandvelle-et-le-Perrenot, 70190")
Console.create!(name: "WII", year: 2006, description: 'a bit slow, but comes with nice games', user: @user,
                price_per_day: 5, address: "24750 Boulazac Isle Manoire")
Console.create!(name: "PSP", year: 2004, description: 'My son barely played with it so the condition is perfect',
                user: @user, price_per_day: 10, address: "Vaison-la-Romaine, 84110")
Console.create!(name: "PS4", year: 2013, description: 'Very good condition, comes with 3 game pads', user: @user,
                price_per_day: 12, address: "Nesle, 80190")
Console.create!(name: "Nintendo DS Lite", year: 2006, description: 'The console is very good but a button is a bit hard
                to play with', user: @user, price_per_day: 6, address: "Le Rheu, 35650")
Console.create!(name: "WII", year: 2006, description: 'everything works very nicely', user: @user, price_per_day: 9,
                address: "Saint-Denis-en-Val, 45560")
Console.create!(name: "PS3", year: 2006, description: 'a bit old but in very good condition', user: @user,
                price_per_day: 9, address: "93110 Rosny-sous-Bois")
Console.create!(name: "Nintendo Switch", year: 2017, description: 'Barely used, and comes with a bunch of games',
                user: @user, price_per_day: 15, address: "28 Rue du Golf, 36160 Pouligny-Notre-Dame")
Console.create!(name: "PS1", year: 1994, description: 'this old console works very nicely', user: @user,
                price_per_day: 12, address: "Jas, 42110")
Console.create!(name: "XBOX", year: 2013, description: 'This console is super cool to play with', user: @user,
                price_per_day: 11, address: "86200 Loudun")

Booking.create!(console_id: Console.last.id, user_id: User.last.id)
