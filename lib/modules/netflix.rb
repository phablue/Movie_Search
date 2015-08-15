module Netflix
  class Movies
    def initialize(movie)
      @movie = movie
    end

    def url
      watch_url if existed?
    end

    private
    def existed?
      get_id != "Unable to locate data"
    end

    def watch_url
      "http://www.netflix.com/watch/#{get_id}"
    end

    def get_id
      NetflixRoulette.get_netflix_id(@movie.title)
    end
  end
end