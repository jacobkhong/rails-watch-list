# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'httparty'
require 'json'

puts "Clear Database"
Movie.destroy_all

# Url for Json
url = "https://tmdb.lewagon.com/movie/top_rated"

# Httprequest
response = HTTParty.get(url)

# check if request was successful
if response.code == 200
  movies_data = JSON.parse(response.body)['results']

  movies_data.each do |movie_data|
    Movie.create(
      title: movie_data['title'],
      overview: movie_data['overview'],
      poster_url: movie_data['poster_path"'],
      rating: movie_data['vote_average']
    )
  end
  puts "Seed Successfully!"
else
  puts "Failed to fetch movies: #{response.code} - #{response.message}"
end


List.create(
  name: "Drama"
)

List.create(
  name: "Classic"
)
