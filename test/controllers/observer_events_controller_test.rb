require 'test_helper'

class ObserverEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get observer_events_new_url
    assert_response :success
  end

  test "should get edit" do
    get observer_events_edit_url
    assert_response :success
  end

end
