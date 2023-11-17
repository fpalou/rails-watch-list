require 'open-uri'
require 'json'

Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
for i in 1..2 do
  url = "https://tmdb.lewagon.com/movie/top_rated?language=en-US&page=#{i}"
  response = URI.open(url).read
  data = JSON.parse(response)
  data['results'].each do |e|
    Movie.create(title: e['title'], overview: e['overview'], poster_url: "https://www.themoviedb.org/t/p/original#{e['poster_path']}", rating: e['vote_average'])
    puts 'Entry created'
  end
end
for i in 1..2 do
  url = "https://tmdb.lewagon.com/movie/popular?language=en-US&page=#{i}"
  response = URI.open(url).read
  data = JSON.parse(response)
  data['results'].each do |e|
    Movie.create(title: e['title'], overview: e['overview'], poster_url: "https://www.themoviedb.org/t/p/original#{e['poster_path']}", rating: e['vote_average'])
    puts 'Entry created'
  end
end

for i in 1..2 do
  url = "https://tmdb.lewagon.com/movie/now_playing?language=en-US&page=#{i}"
  response = URI.open(url).read
  data = JSON.parse(response)
  data['results'].each do |e|
    Movie.create(title: e['title'], overview: e['overview'], poster_url: "https://www.themoviedb.org/t/p/original#{e['poster_path']}", rating: e['vote_average'])
    puts 'Entry created'
  end
end
