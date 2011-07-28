require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup :login

  test "should get index" do
    get :index
    assert_response :success
  end

  protected

  def login
    @user = User.create(:provider => "twitter", :uid => 0, :name => "Admin", :admin => true)
    session[:user_id] = @user.id
  end
end
