module Movies
  class Search
    def initialize(search_term)
      @search_term = search_term
    end

    def results
      matching_movies = get_matching_movies
      { data: matching_movies, message: result_message(matching_movies.size) }
    end

    private
    def get_matching_movies
      Movie.where("title like ?" , "%#{@search_term}%").order(:title)
    end

    def result_message(result_count)
      "Found <b> #{result_count} </b> movies according to the search term <b> #{@search_term} </b>".html_safe
    end
  end
end
