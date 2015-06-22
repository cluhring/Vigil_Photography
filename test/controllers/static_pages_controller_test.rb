require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  def setup
    @app_name = "Vigil Photography"
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "#{@app_name}"
  end

  test "should get portfolio" do
    get :portfolio
    assert_response :success
    assert_select "title", "#{@app_name} | Portfolio Page"
  end

  test "should get about_me" do
    get :about_me
    assert_response :success
    assert_select "title", "#{@app_name} | About Me Page"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "#{@app_name} | Contact Page"
  end

  test "should get faqs" do
    get :faqs
    assert_response :success
    assert_select "title", "#{@app_name} | Frequently Asked Questions Page"
  end
end
