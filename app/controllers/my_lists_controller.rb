class MyListsController < ApplicationController
  def index
    @my_lists = MyList.all
  end

  def create
    redirect_to :back
  end

  def destroy
    @my_list = MyList.find(params[:id])
    @my_list.destroy
    redirect_to :back
  end
end
