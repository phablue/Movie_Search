module RankingsHelper
  def released_years
    years = []
    current_year = Time.now.year.to_i

    (1880..current_year).each { |y| years << y }
    years.reverse
  end

  def movie_genres
    ['Action', 'Adventure', 'Animation', 'Biography', 'Comedy', 'Crime',
     'Documentary', 'Drama', 'Family', 'Fantasy', 'Film-Noir', 'History', 'Horror',
     'Music', 'Musical', 'Mystery', 'Romance', 'Sci-Fi', 'Sport', 'Thriller', 'War',
     'Western']
  end
end

