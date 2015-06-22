require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 3
    assert_select "a[href=?]", faqs_path
    assert_select "a[href=?]", about_me_path
    assert_select "a[href=?]", portfolio_path
    assert_select "a[href=?]", contact_path
    assert_select "title", "Vigil Photography | New User Page"
  end
end
