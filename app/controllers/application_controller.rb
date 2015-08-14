class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :active_header

  private
  def active_header
    @active_header = true
  end
end
