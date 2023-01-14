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
  user = User.create(email: "lisa_#{i}@lisa.com", password: '123456')
  users << user
end

users.each do |user|
  Console.create(name: 'PS1', year: 2005, description: 'old console', user_id: user.id)
end

Booking.create!(console_id: Console.last.id, user_id: User.last.id)
