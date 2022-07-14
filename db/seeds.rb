require 'faker'
require 'open-uri'
require 'json'

# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

# puts "creating movies..."
# 100.times do
#   movie = Movie.create(title: Faker::Movie.title , overview: Faker::Movie.quote,
#     poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: rand(1.0..9.9).round(1))
#   puts "created movie: #{movie.id}"
# end

# TMDB api call for seeding database -

# set variable for page number
page_num = 1

5.times do # make 5 api calls to retrieve the 100 top_rated movies
  url = "https://api.themoviedb.org/3/movie/top_rated?api_key=29c6e3b9265c0cbd7b5b0d7eb7a1ba73&language=en-US&page=#{page_num}"
  puts "fetching movies..... \n"
  movies_serialized = URI.open(url).read
  movies = JSON.parse(movies_serialized)

  puts "creating movies..... \n"
  movies['results'].each do |movie|
    puts movie['title']
    movie_data = Movie.create(title: movie['title'], overview: movie['overview'],
    rating: movie['vote_average'], poster_url: movie['poster_path'])

    puts "created movie: #{movie_data.id}"
  end
  page_num += 1
end
puts "seeding lists...."
List.create(name: 'Drama')
List.create(name: 'sci-fi')
puts 'database seeding is complete✅'

# https://developers.themoviedb.org/3/movies/get-top-rated-movies
