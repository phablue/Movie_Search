module MoviesHelper
  def imdb_link(imdb_id)
    "http://www.imdb.com/title/#{imdb_id}"
  end

  def invalid_watch?(netflix, amazon)
    netflix.nil? && amazon.nil?
  end

  def decorate(data)
    data == "N/A" ? "" : data
  end
end
