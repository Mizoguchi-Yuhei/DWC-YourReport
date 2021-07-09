class ObserverController < ApplicationController
  def show
    @observer = current_observer
    @followes = @observer.follow
  end

  def search
    keyword = params[:keyword]
    @learners = Learner.search(keyword)
    @observer = current_observer
  end
end
