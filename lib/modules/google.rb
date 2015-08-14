require 'google/api_client'

module Google
  class Youtube
    attr_reader :url
    YOUTUBE_API_VERSION = 'v3'

    def initialize(movie)
      @movie_trailer = "#{movie} trailer"
      @url = "https://www.youtube.com/watch?v=#{get_video_id}"
    end

    def get_video_id
      begin
        search.data.items[0].id.videoId
      rescue Google::APIClient::TransmissionError => e
        e.result.body
      end
    end

    def search
      client, youtube = configuration

      client.execute!(
        :api_method => youtube.search.list,
        :parameters => {
          :part => 'snippet',
          :q => @movie_trailer,
          :maxResults => 1,
          :type => 'video'
        }
      )
    end

    def configuration
      client = Google::APIClient.new(
        :key => ENV['GOOGLE_ACCESS_KEY_ID'],
        :authorization => nil,
        :application_name => 'Movie Time',
        :application_version => '1.0.0'
      )
      youtube = client.discovered_api('youtube', YOUTUBE_API_VERSION)

      return client, youtube
    end
  end
end


