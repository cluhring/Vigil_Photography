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
end
