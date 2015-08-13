class MoviesController < ApplicationController
  def main
    @active_header = false
  end

  def result
    search_term = params["q"].strip
    @movies = search_results_about(search_term)
    flash[:notice] = search_result_message(@movies.size, search_term)
  end

  def search_results_about (search_term)
    if unavailable?(search_term)
      flash[:error] = error_message
      redirect_to "/"
    else
      Movie.all.select(&included?(search_term))
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private
  def unavailable? (search_term)
    search_term.nil? || search_term.length < 2
  end

  def included? (search_term)
    Proc.new {|movie| movie.title.include?(search_term)}
  end

  def error_message
    "The search word must be more than 2 characters."
  end

  def search_result_message (result_count, search_term)
    "Found #{result_count} movies according to the search term '#{search_term}'"
  end
end
