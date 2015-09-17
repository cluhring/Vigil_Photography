require 'test_helper'

class GuestsControllerTest < ActionController::TestCase
  def setup
    @app_name = "Vigil Photography"
  end

  test "should get contact" do
    get :index
    assert_response :success
    assert_select "title", "#{@app_name} | Contact Page"
  end

  # this test fires off an email to the default email listed in mailers/guest_mailer.rb
  # test "should create new user" do
  #   assert_difference("Guest.count") do
  #     post :create, guest: attributes_for(:guest)
  #   end
  #   assert_redirected_to root_path(assigns(:guest))
  # end
end
