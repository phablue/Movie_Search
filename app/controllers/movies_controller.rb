class MoviesController < ApplicationController
  def home
    @active_header = false
  end

  def search
    search_word = params["q"].strip
    @movies = search_results(search_word)
  end

  def search_results (search_word)
    if unavailable?(search_word)
      flash[:error] = errorMessage
      redirect_to "/"
    else
      Movie.all.select(&included?(search_word))
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private
  def unavailable? (search_word)
    search_word.nil? || search_word.length < 2
  end

  def included? (search_word)
    Proc.new {|movie| movie.title.include?(search_word)}
  end

  def errorMessage
    "The search word must be more than 2 characters."
  end
end
