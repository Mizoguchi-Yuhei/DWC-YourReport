require 'test_helper'

class Learner::DailyTestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get learner_daily_tests_new_url
    assert_response :success
  end

  test "should get show" do
    get learner_daily_tests_show_url
    assert_response :success
  end

  test "should get edit" do
    get learner_daily_tests_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get learner_daily_tests_destroy_url
    assert_response :success
  end

end
