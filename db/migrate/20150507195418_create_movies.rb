class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :rated
      t.string :released
      t.string :runtime
      t.string :genre
      t.string :director
      t.string :writer
      t.text :actors
      t.text :plot
      t.text :awards
      t.string :poster
      t.string :meta_score
      t.string :imdb_rating
      t.string :imdb_votes
      t.string :imdb_ID
      t.string :type_
      t.string :tomato_meter
      t.string :tomato_rating
      t.string :tomato_reviews
      t.string :tomato_fresh
      t.string :tomato_rotten
      t.text :tomato_consensus
      t.string :tomato_user_meter
      t.string :tomato_user_rating
      t.string :tomato_user_reviews
      t.string :dvd
      t.string :box_office

      t.timestamps null: false
    end
  end
end
