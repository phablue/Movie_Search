module RankingsHelper
  def years
    years = []
    current_year = Time.now.year.to_i

    (1880..current_year).each { |y| years << y }
    years << 'Any'
    years.reverse
  end

  def movie_genres
    ['Any', 'Action', 'Adventure', 'Animation', 'Biography', 'Comedy', 'Crime',
     'Documentary', 'Drama', 'Family', 'Fantasy', 'Film noir', 'History', 'Horror',
     'Music', 'Musical', 'Mystery', 'Romance', 'Sci fi', 'Sport', 'Thriller', 'War',
     'Western']
  end
end

