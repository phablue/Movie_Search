class RankingsController < ApplicationController
  def main
    @movies = movies_ranking(params[:genre], params[:year], params[:reviewer])
    @num = 0
    @options = selected_options(params[:genre], params[:year], params[:reviewer])
  end

  private
  def movies_ranking(genre, year, reviewer)
    Movies::Ranking.new(genre, year, reviewer).results
  end

  def selected_options(genre, year, reviewer)
    Movies::Ranking.new(genre, year, reviewer).selected_options
  end
end
