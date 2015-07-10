class MoviesController < ApplicationController
  def search
    @search_word = params["q"]
    render json: search_results unless unavailable_search_word?
  end

  def search_results
    Movie.where(title: titles_included_search_word)
  end

  private
  def titles_included_search_word
    all_movies_title = Movie.pluck(:title)
    all_movies_title.select {|movie| movie.include?(@search_word)}
  end

  def unavailable_search_word?
    @search_word.nil? || @search_word.length < 2
  end
end
