module Movies
  class Ranking
    def initialize(genre, year, reviewer)
      @genre = genre
      @year = year
      @reviewer = reviewer
    end

    def results
      Movie.where("genre like ? or genre like ?", genre[0], is_nil?(genre[1]))
           .where("year like ? or year like ?", year[0], is_nil?(year[1]))
           .where.not(reviewer => '')
           .order(reviewer => :desc).limit(20)
    end

    def selected_options
      options = { genre: convert_capitalize(@genre), year: convert_capitalize(@year), reviewer: selected_reviewer }
    end

    def selected_reviewer
      return 'IMDB' if @reviewer == 'imdb'
      @reviewer.split(" ").each{|word| word.capitalize!}.join(" ")
    end

    def convert_capitalize(string)
      string.split(',').each{|word| word.capitalize!}
    end

    def is_nil?(option)
      option.nil? ? '' : option
    end

    def genre
      @genre == 'any' ? ['%%'] : @genre.split(',').collect { |o| "%#{o}%" }
    end

    def year
      @year == 'any' ? ['%'] : @year.split(',').collect { |o| "%#{o}%" }
    end

    def reviewer
      @reviewer == 'rotten tomatoes' ? 'tomato_meter' : 'metacritic'
    end
  end
end
