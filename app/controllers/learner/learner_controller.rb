class LearnerController < ApplicationController
  def show
    @learner = current_user
    @goals = current_user.goals.all
    @tests = current_user.tests.all
  end
end
