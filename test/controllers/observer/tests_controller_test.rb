require 'test_helper'

class Observer::TestsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get observer_tests_show_url
    assert_response :success
  end

end
