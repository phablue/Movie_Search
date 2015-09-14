module Netflix
  class Movies
    include HTTParty

    def initialize(movie)
      @movie = movie
      @url = 'http://netflixroulette.net/api/api.php?'
    end

    def url
      watch_url unless get_id.nil?
    end

    private
    def watch_url
      "http://www.netflix.com/watch/#{get_id}"
    end

    def get_id
      HTTParty.get(@url + options).parsed_response['show_id']
    end

    def options
      "title=#{ERB::Util.url_encode(@movie.title)}&year=#{@movie.year}"
    end
  end
end
