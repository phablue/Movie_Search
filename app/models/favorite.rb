class Favorite < ActiveRecord::Base
  has_one: :movie
  has_one: :user
end
