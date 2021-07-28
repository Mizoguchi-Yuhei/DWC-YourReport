class Learner::FollowRequestsController < ApplicationController
  def index
    @requests = current_learner.follow_requests.all
  end

  # フォローリクエスト許可
  def allow
    request = FollowRequest.find(params[:id])
    observer = Observer.find_by(id: request.observer_id)
    follow = current_learner.observer_follows.new(learner_id: current_learner.id, observer_id: observer.id)
    follow.save
    request.destroy
    redirect_to learner_mypage_path(current_learner)
  end

  # フォローリクエスト拒否
  def destroy
    request = FollowRequest.find(parsms[:id])
    request.destroy
    redirect_to learner_mypage_path(current_learner)
  end
end
