module OmdbApi
  class Movies
    attr_reader :url
    include HTTParty

    def initialize
      @url = 'http://www.omdbapi.com/?'
    end

    def get_data
      imdb_ID = start_imdb_ID

      5.times do
        data = get_data_by(imdb_ID)
        set_only_movie(data)

        imdb_ID = next_imdb_ID(imdb_ID)
      end
    end

    def get_data_by(imdb_ID)
      HTTParty.get(@url + options(imdb_ID))
    end

    def set_only_movie(data)
      create(data) if type_is_movie?(data)
    end

    def next_imdb_ID(preview_id)
      'tt%.7d'%(preview_id.slice(2,7).to_i + 1)
    end

    def options(imdb_ID)
      "i=#{imdb_ID}&tomatoes=ture"
    end

    def start_imdb_ID
      begin
        unless Movie.last.imdb_ID.nil?
          Movie.last.imdb_ID
        end
      rescue NoMethodError
        'tt0000001'
      end
    end

    def type_is_movie?(data)
      data['Type'] == 'movie'
    end

    def create(movie)
      Movie.create(
        title: movie['Title'], year: movie['Year'], rated: movie['Rated'],
        released: movie['Released'], runtime: movie['Runtime'], genre: movie['Genre'],
        director: movie['Director'], writer: movie['Writer'], actors: movie['Actors'],
        plot: movie['Plot'], awards: movie['Awards'], poster: movie['Poster'],
        meta_score: movie['Metascore'], imdb_rating: movie['imdbRating'],
        imdb_votes: movie['imdbVotes'], imdb_ID: movie['imdbID'], type_: movie['Type'],
        tomato_meter: movie['tomatoMeter'], tomato_rating: movie['tomatoRating'],
        tomato_reviews: movie['tomatoReviews'], tomato_fresh: movie['tomatoFresh'],
        tomato_rotten: movie['tomatoRotten'], tomato_consensus: movie['tomatoConsensus'],
        tomato_user_meter: movie['tomatoUserMeter'], tomato_user_rating: movie['tomatoUserRating'],
        tomato_user_reviews: movie['tomatoUserReviews'], dvd: movie['DVD'], box_office: movie['BoxOffice']
      )
    end
  end
end

