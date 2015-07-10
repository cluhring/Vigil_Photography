require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "new" do
    get :new
    assert_template 'sessions/new'
  end

  test "create sad" do
    post :create, session: { email: "", password: ""}
    assert_template 'new'
    assert flash[:danger]
    assert_equal "Invalid email/password combination", flash[:danger]
  end

  test "create happy" do
    user = create(:user)
    post :create, session: { email: "test@example.com", password: "password"}
    refute flash[:danger]
    assert_redirected_to user_url(user)
    assert_redirected_to user_path(session[:user_id])
  end

  test "destroy" do
  end
end
