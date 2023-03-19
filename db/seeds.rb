# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "json"

puts "destroying all bookmarks movies and lists"
Bookmark.destroy_all
Review.destroy_all
Movie.destroy_all
List.destroy_all

#url = "https://tmdb.lewagon.com/movie/top_rated"
#movies_serialized = URI.open(url).read
#movies = JSON.parse(movies_serialized)

User.new(email: "pablorubiiimonzo@gmail.com", password: "pablorubiiimonzo@gmail.com").save!
User.new(email: "maribel@gmail.com", password: "maribel@gmail.com").save!
User.new(email: "hugo@gmail.com", password: "hugo@gmail.com").save!

#movies["results"].each do |movie|
 # Movie.create(title: movie["original_title"], overview: movie["overview"], poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}", rating: movie["vote_average"].to_i)
#end

puts "I am creating lists now"

List.create!(name: "Drama", user: User.last)
List.create!(name: "Comedy", user: User.first)
List.create!(name: "Action", user: User.last)
List.create!(name: "Romantic", user: User.first)
