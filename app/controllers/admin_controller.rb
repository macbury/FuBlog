class AdminController < ApplicationController
  before_filter :login_required!
  check_authorization
  
  def admin_panel
    authorize! :manage, Entry
    render layout: false, action: "admin"
  end
end
