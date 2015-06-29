require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @app_name = "Vigil Photography"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "#{@app_name} | New User Page"
  end

  test "should get show" do
    user = create(:user)
    get(:show, {:id => user.id })
    assert_response :success
    assert_select "title", "#{@app_name} | #{user.first_name} #{user.last_name}"
  end

  test "should create new user" do
    assert_difference("User.count") do
      post :create, user: attributes_for(:user)
    end
    assert_redirected_to user_path(assigns(:user))
  end
end
