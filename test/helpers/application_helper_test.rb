require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal title_helper, "Vigil Photography"
    assert_equal title_helper("Help Page"), "Vigil Photography | Help Page"
  end
end
