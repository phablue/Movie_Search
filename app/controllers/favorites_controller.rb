class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    @favorite = Favorite.new(movie_id: params[:movie_id], user_id: current_user.id)
    render json: @favorite.save ? @favorite : {status: false}
  end

  def destroy
    @favorite = Favorite.find(params[:list_id])
    @favorite.destroy
    render nothing: true
  end
end
