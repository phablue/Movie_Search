module Movies
  class Search
    def initialize(search_term)
      @search_term = search_term
    end

    def results
      if unavailable?
        flash[:error] = error_message
        redirect_to "/"
      else
        matching_movies = get_matching_movies
        { data: matching_movies, message: result_message(matching_movies.size) }
      end
    end

    private
    def unavailable?
      @search_term.nil? || @search_term.length < 2
    end

    def get_matching_movies
      Movie.where("title like ?" , "%#{@search_term}%").order(:title)
    end

    def error_message
      "The search word must be more than 2 characters."
    end

    def result_message(result_count)
      "Found #{result_count} movies according to the search term '#{@search_term}'"
    end
  end
end