class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in?
  before_filter :setup_meta_tags

  http_basic_authenticate_with(:name => "bury", :password => "bury") if Rails.env == "development"

  private
    def setup_meta_tags
      
      set_meta_tags site: "FuBlog",
                    description: 'Some description',
                    keywords: 'Site, Login, Members'
    end

    def current_user
      return false unless session[:user_id]
      @current_user ||= User.where(session_token: session[:user_id]).first
    end
    
    def logged_in?
      current_user.present?
    end

    def login_required!
      unless logged_in?
        flash[:error] = t('flash.error.login_required')
        redirect_to root_url
      end
    end

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, :alert => exception.message
    end
end
