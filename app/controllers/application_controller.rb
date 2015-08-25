class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action  :store_location
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :active_header

  protected
  def authenticate_user!(options={})
    if user_signed_in?
      super(options)
    else
      respond_to do |format|
        format.json { render json: {status: 'unauth'} }
        format.html { redirect_to "/"}
      end
    end
  end

  def store_location
    return unless request.get? 
    if (request.path != "/sign-in" &&
        request.path != "/sign-up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath 
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  private
  def active_header
    @active_header = true
  end
end
