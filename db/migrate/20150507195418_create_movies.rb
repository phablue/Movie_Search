class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :awards
      t.string :box_office
      t.string :cast
      t.string :country
      t.string :director
      t.string :dvd
      t.text :full_plot
      t.string :genre
      t.string :image
      t.string :imdb_ID, unique: true, null: false
      t.string :imdb_rating
      t.string :imdb_votes
      t.string :language
      t.string :last_updated
      t.string :metacritic
      t.text :plot
      t.string :poster
      t.string :production
      t.string :rating
      t.string :released
      t.string :runtime
      t.string :title
      t.text :tomato_consensus
      t.string :tomato_fresh
      t.string :tomato_meter
      t.string :tomato_rating
      t.text :tomato_reviews
      t.string :tomato_rotten
      t.string :tomato_user_meter
      t.string :tomato_user_rating
      t.text :tomato_user_reviews
      t.string :website
      t.string :writer
      t.string :year

      t.timestamps null: false
    end
  end
end
