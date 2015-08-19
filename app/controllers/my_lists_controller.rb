class MyListsController < ApplicationController
  def index
    @my_lists = MyList.all
  end

  def create
    # @my_list = MyList.new(movie_id: params[:movie_id])
    render json: params[:movie_id].nil? ? false : true
  end

  def destroy
    @my_list = MyList.find(params[:id])
    @my_list.destroy
    redirect_to :back
  end
end
