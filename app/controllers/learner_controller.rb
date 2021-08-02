class LearnerController < ApplicationController
  def show
    @learner = current_learner
    @followers = current_learner.observer_follows.all
    @requests = current_learner.follow_requests.all
    @learner_events = current_learner.learner_events.all
    @goals = current_learner.goals.order("updated_at DESC").page(params[:goal_page]).per(5)
    @tests = current_learner.tests.order("updated_at DESC").page(params[:tests_page]).per(3)
    @daily_tests = current_learner.daily_tests.order("updated_at DESC").page(params[:daily_tests_page]).per(5)
  end
end
