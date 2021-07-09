require 'test_helper'

class Observer::LearnersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get observer_learners_show_url
    assert_response :success
  end

end
