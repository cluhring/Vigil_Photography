require 'test_helper'

class UserExperienceTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "a new user can signup on the new page" do
    get new_user_path
    assert_select "title", "Vigil Photography | New User Page"
    assert_template "users/new"
    assert_difference "User.count", 1 do
      post users_path, user: attributes_for(:user)
    end
    assert current_path = "users/show"
    assert flash[:success]
    assert_equal "Thanks for expressing interest in my Photography!", flash[:success]
  end

  test "a user can signup" do
    visit new_user_path
    within(".new_user") do
      fill_in "user[first_name]", with: "Bob"
      fill_in "user[last_name]", with: "Smith"
      fill_in "user[email]", with: "bob_smith@email.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_button("Create account")
    end
    within(".alert-success") do
      assert page.has_content?("Thanks for expressing interest in my Photography!")
    end
  end

  test "an invalid user cannot signup on the new page" do
    assert_no_difference "User.count" do
      post users_path, user: attributes_for(:invalid_user)
    end
    assert current_path = "users/new"
  end

  test "a user can not signup without a valid password" do
    visit new_user_path
    within(".new_user") do
      fill_in "user[first_name]", with: "Bob"
      fill_in "user[last_name]", with: "Smith"
      fill_in "user[email]", with: "bob_smith@email.com"
      fill_in "user[password]", with: "pass"
      fill_in "user[password_confirmation]", with: "pass"
      click_button("Create account")
    end
    within("#error_explanation") do
      assert page.has_content?("Password is too short (minimum is 6 characters)")
    end
  end

  test "a user only sees invalid login flash message once" do
    user = create(:user)
    visit login_path
    assert template = 'sessions/new'
    fill_in "session[email]", with: "test@example.com"
    fill_in "session[password]", with: "passworks"
    click_button("Log in")
    assert_template = 'session/new'
    within(".alert-danger") do
      assert page.has_content?("Invalid email/password combination")
    end
    visit root_path
    refute page.has_content?("Invalid email/password combination")
  end

  test "a user only sees invalid login flash message once" do
    user = create(:user)
    visit login_path
    assert template = 'sessions/new'
    fill_in "session[email]", with: "test@example.com"
    fill_in "session[password]", with: "passworks"
    click_button("Log in")
    assert_template = 'session/new'
    within(".alert-danger") do
      assert page.has_content?("Invalid email/password combination")
    end
    visit root_path
    refute flash[:danger]
    assert flash.empty?
    refute_equal "Invalid email/password combination", flash[:danger]
  end
end
