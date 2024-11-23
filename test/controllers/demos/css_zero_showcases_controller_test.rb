require "test_helper"

class Demos::CssZeroShowcasesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get demos_css_zero_showcases_index_url
    assert_response :success
  end
end
