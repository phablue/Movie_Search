module MoviesHelper
  def netflix_has?(movie)
    Netflix::Movies.new.get_url(movie.title)
  end

  def amazon_has?(movie)
    Amazon::Movies.new.get_url(movie)
  end
end
