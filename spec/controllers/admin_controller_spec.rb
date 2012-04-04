require 'spec_helper'

describe AdminController do
  context "as admin" do
    before(:each) do
      login_as_admin!
    end

    it "should show admin interface" do
      get :admin_panel
      should respond_with(:success)
    end
  end
  context "as user" do
    before(:each) do
      login_as_user!
    end

    it "should not show admin interface" do
      get :admin_panel
      should redirect_to(root_path)
    end
  end
  context "as guest" do
    before(:each) do
      login_as_user!
    end

    it "should not show admin interface" do
      get :admin_panel
      should redirect_to(root_path)
    end
  end
end
