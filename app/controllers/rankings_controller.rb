class RankingsController < ApplicationController
  def main
    @movies = movies_ranking(params[:genre], params[:year], params[:reviewer])
    @num = 0
  end

  private
  def movies_ranking(genre, year, reviewer)
    Movies::Ranking.new(genre, year, reviewer).results
  end
end
