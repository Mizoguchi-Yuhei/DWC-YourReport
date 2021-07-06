require 'test_helper'

class LearnerControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get learner_show_url
    assert_response :success
  end

end
