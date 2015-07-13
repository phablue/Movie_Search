class MoviesController < ApplicationController
  def home
    @active_header = false
  end

  def search
    search_word = params["q"].strip
    @result = search_results (search_word)
  end

  def search_results (search_word)
    if unavailable?(search_word)
      flash[:error] = errorMessage
      redirect_to "/"
    else
      titles_including(search_word)
    end
  end

  private
  def titles_including (search_word)
    all_movies_title = Movie.pluck(:title)
    all_movies_title.select {|movie| movie.include?(search_word)}
  end

  def unavailable? (search_word)
    search_word.nil? || search_word.length < 2
  end

  def errorMessage
    "The search word must be more than 2 characters."
  end
end
