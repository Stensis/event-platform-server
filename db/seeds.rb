# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(
    fullname: "John Doe",
    username: "johndoe",
    email: "johndoe@example.com",
    password: "password",
    password_digest: BCrypt::Password.create("password"),
    role: "user",
    profilepicture: "https://media.istockphoto.com/id/1406197730/photo/portrait-of-a-young-handsome-indian-man.jpg?b=1&s=170667a&w=0&k=20&c=KtmKHyOE6MJV0w2DiGX8P4399KHNbZ3p8lCjTEabGcY=",
    tel: 1234567890
  )
  