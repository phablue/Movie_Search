class RankingsController < ApplicationController
  def main
    @movies = movies_ranking(params[:genre], params[:released], sption_of(params[:reviewer]))
    @num = 0
  end

  private
  def movies_ranking(genre, released, reviewer)
    Movies::Ranking.new(genre, released, reviewer)
  end
end
