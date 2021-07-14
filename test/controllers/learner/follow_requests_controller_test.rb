require 'test_helper'

class Learner::FollowRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get learner_follow_requests_index_url
    assert_response :success
  end

end
