require 'test_helper'

class LearnerEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get learner_events_new_url
    assert_response :success
  end

end
