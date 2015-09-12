module Movies
  class Ranking
    def initilize(genre, released, reviewer)
      @genre = genre
      @released = released
      @reviewer = reviewer
    end

    def movies_ranking
      Movie.where(options).where.not(reviewer => 'N/A').order(reviewer => :desc).limit(20)
    end

    def options
      { genre: genre, released: released }
    end

    def genre
      @genre == 'any' ? : @genre.split
    end

    def released
      @released == 'any' ? : @released.split
    end

    def reviewer
      @reviewer == 'rotten tomatoes' ? 'tomato_meter' : 'imdb_rating'
    end
  end
end
