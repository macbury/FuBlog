require 'spec_helper'

describe SessionsController do
  before do
    OmniAuth.config.mock_auth[:twitter] = {
      'uid' => '123545'
    }
  end
  it "should login" do
    user = mock_model(User)
    session_token = SecureRandom.hex(32)
    User.should_receive(:from_omniauth).and_return(user)
    user.should_receive(:session_token!).and_return(session_token)

    post :create

    should respond_with(302)
    controller.session[:user_id].should eq(session_token)
    should redirect_to(root_path)
  end

  it "should redirect to root on failure" do
    get :failure
    should respond_with(302)
    should redirect_to(root_path)
  end

  it "should logout" do

    delete :destroy
    should respond_with(302)
    should redirect_to(root_path)
  end

end
