require 'rails_helper'
require "#{Rails.root}/lib/modules/omdb_api.rb"

describe Omdb::Movies do
  fixtures :movies

  before(:each) do
    @omdb_movies = Omdb::Movies.new

    stub_request(:get, @omdb_movies.url)
      .with(query: { i: 'tt2294630', tomatoes: 'true' })
      .to_return( body: {'Title' => 'Starwars', 'imdbID' => 'tt2294630', 'Type' => 'movie'}.to_json,
                  status: 200, headers: { content_type: 'application/json' })

    @movies = [ {"Title" => "The Good Wife", "imdbID" => "tt1442462", "Type" => "series"},
               {"Title" => "Frozen", "imdbID" => "tt2294629", "Type" => "movie"}]
  end

  describe 'Test "get_data_by" method' do
    it 'Response[Title] is Starwars, when server sucefully response' do
      imdb_ID = 'tt2294630'

      response = @omdb_movies.get_data_by(imdb_ID)

      expect(response['Title']).to eq 'Starwars'
    end

    it 'Raise error, when a requesting query option is not right' do
      imdb_ID = 'tt0000001'

      expect{ @omdb_movies.get_data_by(imdb_ID) }.to raise_error(WebMock::NetConnectNotAllowedError)
    end
  end

  describe 'Test "start_imdb_ID" method' do
    it 'Return "tt2294630", when there are movie data' do

      expect(Movie.last.imdb_ID).to eq "tt2294629"
      expect(Movie.all.length).to eq 2
      expect(@omdb_movies.start_imdb_ID).to eq 'tt2294630'
    end

    it 'Return "tt0000001", when there are no movie data' do
      Movie.destroy_all

      expect(Movie.all.length).to eq 0
      expect(@omdb_movies.start_imdb_ID).to eq 'tt0000001'
    end
  end

  describe 'Test "next_imdb_ID" method' do
    it 'Return "tt2294630", when the previes imdb ID is "tt2294629"' do
      preview_id = movies(:one).imdb_ID

      expect(preview_id).to eq "tt2294629"

      expect(@omdb_movies.next_imdb_ID(preview_id)).to eq 'tt2294630'
    end
  end

  it 'Return true, when data type is movie.' do
    expect(@omdb_movies.type_is_movie?(@movies[0])).to be false
    expect(@omdb_movies.type_is_movie?(@movies[1])).to be true
  end
end
