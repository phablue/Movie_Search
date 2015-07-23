module Amazon
  class Movies
    def initialize
      @request = Vacuum.new
      configure()
    end

    def get_url (movie)
      movie = get_movie(movie.director, movie.title)
      Nokogiri::XML(movie.body).xpath("//xmlns:DetailPageURL").text
    end

    private
    def configure
      @request.configure(
        aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
        associate_tag: ENV["AWS_ASSOCIATE_TAG"]
      )
    end

    def get_movie (director, title)
      @request.item_search(
        query: {
          'BrowseNode' => '2858778011',
          'Director' => director,
          'SearchIndex' => 'Video',
          'Title' => title
        }
      )
    end
  end
end