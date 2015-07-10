class MoviesController < ApplicationController
  def search
    @search_word = params["q"]
    render json: search_results unless unavailable_search_word?
  end

  def search_results
    all_movies = Movie.pluck(:title)
    all_movies.select {|movie| movie.include?(@search_word)}
  end

  def show    
  end

  private
  def unavailable_search_word?
    @search_word.nil? || @search_word.length < 2 
  end
end
