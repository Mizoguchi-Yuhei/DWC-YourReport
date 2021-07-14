require 'test_helper'

class Observer::ObserverControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get observer_observer_show_url
    assert_response :success
  end

end
