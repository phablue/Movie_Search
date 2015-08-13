namespace :gather do
  desc "Movies from OMDB"
  task movies: :environment do
    OmdbApi::Movies.new.get_data
  end
end
