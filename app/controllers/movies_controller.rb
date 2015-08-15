class MoviesController < ApplicationController
  def main
    @active_header = false
  end

  def result
    search_term = params["q"].strip
    search_result = Movies::Search.new(search_term).results

    @movies = search_result[:data]
    flash[:notice] = search_result[:message]
  end

  def show
    @movie = Movie.find(params[:id])
    @netflix_url = Netflix::Movies.new.get_url(@movie)
    @amazon_url = Amazon::Movies.new(@movie).movie_url
  end
end
