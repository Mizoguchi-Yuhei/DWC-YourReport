class ObserverController < ApplicationController
  def show
    @observer = current_observer
    @follows = current_observer.observer_follows.all
  end

  def search
    keyword = params[:keyword]
    @learners = Learner.search(keyword)
    @observer = current_observer
  end
end
