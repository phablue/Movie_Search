module MoviesHelper
  def imdb_link(imdb_id)
    "http://www.imdb.com/title/#{imdb_id}"
  end

  def tomatoes_link(imdb_id)
    RottenTomatoes::Movies.new(imdb_id).link
  end

  def trailer_url(movie)
    Google::Youtube.new(movie.title).url
  end

  def invalid_watch?(netflix, amazon)
    netflix.nil? && amazon.nil?
  end

  def decorate(data)
    data == "N/A" ? "" : data
  end

  def add_to_list?(movie)
    current_user.favorites.where(movie_id: movie.id).first
  end
end
