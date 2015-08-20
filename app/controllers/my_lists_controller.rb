class MyListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @my_lists = MyList.all
  end

  def create
    @my_list = MyList.new(movie_id: params[:movie_id])
    render json: @my_list.save ? @my_list : false
  end

  def destroy
    @my_list = MyList.find(params[:list_id])
    @my_list.destroy
    render nothing: true
  end
end
