require 'test_helper'

class CodeControllerTest < ActionController::TestCase
  setup do
    @code = code(:one)
    Code.create @code.to_param
  end

  setup :login

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:code)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create code" do
    assert_difference('Code.count') do
      post :create, :code => @code.attributes
    end

    assert_redirected_to code_path(assigns(:code))
  end

  test "should show code" do
    get :show, :id => @code.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @code.to_param
    assert_response :success
  end

  test "should update code" do
    put :update, :id => @code.to_param, :code => @code.attributes
    assert_redirected_to code_path(assigns(:code))
  end

  test "should destroy code" do
    assert_difference('Code.count', -1) do
      delete :destroy, :id => @code.to_param
    end

    assert_redirected_to code_index_path
  end

  protected

  def login
    @user = User.create(:provider => "twitter", :uid => 0, :name => "Admin", :admin => true)
    session[:user_id] = @user.id
  end
end
