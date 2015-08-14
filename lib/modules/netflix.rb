module Netflix
  class Movies
    def get_url(movie_title)
      watch_url(movie_title) if existed?(movie_title)
    end

    private
    def existed?(movie_title)
      get_id(movie_title) != "Unable to locate data"
    end

    def watch_url(movie_title)
      "http://www.netflix.com/watch/#{get_id(movie_title)}"
    end

    def get_id(movie_title)
      NetflixRoulette.get_netflix_id(movie_title)
    end
  end
end