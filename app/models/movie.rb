class Movie < ActiveRecord::Base
  has_many :my_lists, dependent: :destroy
end
