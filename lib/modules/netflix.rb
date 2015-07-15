module Netflix
  class Movies
    def get_netflix_url (movie_title)
      netflix_url_of(movie_title) if existed_in_netflix?(movie_title)
    end

    private
    def existed_in_netflix? (movie_title)
      get_netflix_id(movie_title) != "Unable to locate data"
    end

    def netflix_url_of (movie_title)
      "http://www.netflix.com/watch/#{get_netflix_id (movie_title)}"
    end

    def get_netflix_id (movie_title)
      NetflixRoulette.get_netflix_id(movie_title)
    end
  end
end