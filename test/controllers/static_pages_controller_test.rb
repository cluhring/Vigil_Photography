require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home Page | Vigil Photography"
  end

  test "should get portfolio" do
    get :portfolio
    assert_response :success
    assert_select "title", "Portfolio Page | Vigil Photography"
  end

  test "should get about_me" do
    get :about_me
    assert_response :success
    assert_select "title", "About Me Page | Vigil Photography"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact Page | Vigil Photography"
  end

end
