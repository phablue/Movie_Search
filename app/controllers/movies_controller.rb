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
    begin
      @netflix_url = Netflix::Movies.new(@movie).url
    rescue JSON::ParserError
      render template: 'movies/error'
    end
    @amazon_url = Amazon::Movies.new(@movie).url
  end
end
