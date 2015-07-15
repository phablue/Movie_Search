module MoviesHelper
  def netflix_has?(movie)
    Netflix::Movies.new.get_netflix_url(movie.title)
  end
end
