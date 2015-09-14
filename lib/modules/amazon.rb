module Amazon
  class Movies
    def initialize(movie)
      @movie = movie
      @request = Vacuum.new
      configure()
    end

    def url
      movie_url(movie_asin) unless movie_asin.nil?
    end

    private
    def movie_url(movie_asin)
      "http://www.amazon.com/gp/product/#{movie_asin}"
    end

    def movie_asin
      Nokogiri::XML(get_movie).xpath("//xmlns:ASIN")[0].nil? ? nil : Nokogiri::XML(get_movie).xpath("//xmlns:ASIN")[0].content
    end

    def get_movie
      @request.item_search( query: search_options ).body
    end

    def search_options
      { 'Keywords' => @movie.title, 'SearchIndex' => 'Video', 'ResponseGroup' => 'ItemAttributes'}
    end

    def configure
      @request.configure(
        aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
        associate_tag: ENV["AWS_ASSOCIATE_TAG"]
      )
    end
  end
end
