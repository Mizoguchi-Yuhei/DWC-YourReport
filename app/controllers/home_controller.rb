class HomeController < ApplicationController
  def index
    if learner_signed_in?
      @learner = current_learner
    elsif observer_signed_in?
      @observer = current_obsever
    end
  end
end
