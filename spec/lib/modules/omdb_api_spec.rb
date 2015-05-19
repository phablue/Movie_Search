require 'rails_helper'
require "#{Rails.root}/lib/modules/omdb_api.rb"

describe OmdbApi::Movies do
  before(:each) do 
    @omdb_movies = OmdbApi::Movies.new
  end

  it 'Responds successfully with an HTTP 200 status code' do
    imdb_ID = 'tt2294629'
    movie = {"Title" => "Frozen", "imdbID" => "tt2294629", "Type" => "movie"}

    stub_request(:get, @omdb_movies.url + @omdb_movies.options(imdb_ID))
    .to_return(body: movie.to_json, status: 200, headers: {content_type: 'application/json'})

    response = @omdb_movies.get_data_by(imdb_ID)
    response.message
    expect(response).to be_success

  end

  describe 'Test starting imdb ID' do
    it 'Return "tt2294629", when there are movie data' do
      expect(@omdb_movies.start_imdb_ID).to eq 'tt2294629'
    end

    it 'Return "tt0000001", when there are no movie data' do
      Movie.destroy_all

      expect(@omdb_movies.start_imdb_ID).to eq 'tt0000001'
    end
  end

  describe 'Test next searching imdb ID' do
    it 'Return "tt2294630", when the previes imdb ID is "tt2294629"' do
      preview_id = Movie.first.imdb_ID

      expect(preview_id).to eq "tt2294629"

      expect(@omdb_movies.next_imdb_ID(preview_id)).to eq 'tt2294630'
    end
  end

  it 'Return true, when data type is movie.' do
    movies = [ {"Title" => "The Good Wife", "imdbID" => "tt1442462", "Type" => "series"},
               {"Title" => "Frozen", "imdbID" => "tt2294629", "Type" => "movie"}]

    expect(@omdb_movies.type_is_movie?(movies[0])).to be false
    expect(@omdb_movies.type_is_movie?(movies[1])).to be true
  end
end