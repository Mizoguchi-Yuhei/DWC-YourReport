class ObserverController < ApplicationController
  def show
    @observer = current_observer
    @follows = current_observer.observer_follows.all
    @observer_events = current_observer.observer_events.all
  end

  # 検索機能
  def search
    keyword = params[:keyword]
    @learners = Learner.search(keyword)
    @observer = current_observer
    @check = params[:keyword]
  end
end
