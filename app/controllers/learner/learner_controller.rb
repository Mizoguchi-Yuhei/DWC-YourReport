class LearnerController < ApplicationController
  def show
    @learner = current_learner
    @goals = current_learner.goals.all
    @tests = current_learner.tests.all
  end
end
