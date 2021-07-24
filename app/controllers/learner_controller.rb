class LearnerController < ApplicationController
  def show
    @learner = current_learner
    @followers = current_learner.observer_follows.all
    @requests = current_learner.follow_requests.all
    @goals = current_learner.goals.all
    @tests = current_learner.tests.all
    @daily_tests = current_learner.daily_tests.all
  end
end
