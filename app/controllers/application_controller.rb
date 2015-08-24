class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :active_header

  protected
  def authenticate_user!
    unless user_signed_in?
      render json: {status: 'unauth'}
    end
  end

  private
  def active_header
    @active_header = true
  end
end
