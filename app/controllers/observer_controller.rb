class ObserverController < ApplicationController
  def show
    @observer = current_observer
  end

  def search
    @observer = current_observer
    @learners = Learner.search(params[:search])
    @search = params["search"]
  end
end
