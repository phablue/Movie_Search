class Movie < ActiveRecord::Base
  has_and_belongs_to_many :favorites, dependent: :destroy
end
