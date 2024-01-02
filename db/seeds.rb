# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
    User.delete_all

    User.create!(name: 'leonidas', email:'leon@gmail.com', password: 123456)
    User.create!(name: 'fotini', email: 'fotini@gmail.com', password: 'fotini123')
    User.create!(name: 'penny', email: 'penny@gmail.com', password: 'penny123')
    User.create!(name: 'thodwris', email: 'theo@gmail.com', password: 'theo123')
    puts 'users created'

    Post.create!(body: 'this is a post', author_id: 13)
    Post.create!(body: 'this is another post', author_id: 14)
    Post.create!(body: 'this is also a post', author_id: 15)
    Post.create!(body: 'and this is a post', author_id: 16)
    puts 'posts created'