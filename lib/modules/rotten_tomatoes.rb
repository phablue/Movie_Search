module RottenTomatoes
  class Movies
    attr_reader :link
    include HTTParty

    def initialize(imdb_ID)
      @imdb_ID = imdb_ID[2..10]
      @link = get_data["links"]["alternate"]
    end

    private
    def get_data
      JSON.parse(HTTParty.get(url).body)
    end

    def url
      "http://api.rottentomatoes.com/api/public/v1.0/movie_alias.json?type=imdb&id=#{@imdb_ID}"
    end
  end
end
