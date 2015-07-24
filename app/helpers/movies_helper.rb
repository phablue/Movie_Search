module MoviesHelper
  def available_watch?(movie)
    netflix_has?(movie) || amazon_has?(movie)
  end

  def netflix_has?(movie)
    Netflix::Movies.new.get_url(movie.title)
  end

  def amazon_has?(movie)
    Amazon::Movies.new.get_url(movie)
  end

  def decorate(data)
    data == "N/A" ? "" : data
  end
end
