module AuthenticationHelper
  def login_as_user!
    @user = mock_model(User)
    @user.stub!(:admin?).and_return(false)
    controller.stub!(:current_user).and_return(@user)
  end

  def login_as_admin!
    @user = mock_model(User)
    @user.stub!(:admin?).and_return(true)
    controller.stub!(:current_user).and_return(@user)
  end
end

RSpec.configure do |config|
  config.include AuthenticationHelper
end