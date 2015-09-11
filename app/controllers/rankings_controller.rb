class RankingsController < ApplicationController
  def main
    @movies = default_raking
    @num = 0
  end

  private
  def default_raking
    Movie.where.not(tomato_meter: 'N/A').order(tomato_meter: :desc).limit(20)
  end
end
