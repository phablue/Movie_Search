class MyList < ActiveRecord::Base
  validates foreign_key: :movie_id
end
