class Observer::FollowRequestsController < ApplicationController
	def create
		learner = Learner.find(params[:id])
		request = current_observer.follow_requests.new(learner_id: learner.id, observer_id: current_observer.id)
		request.save
		redirect_to observer_mypage_path(current_observer)
	end

	def destroy
		learner = Learner.find(parsms[:id])
		request = current_observer.follow_requests.find_by(learner_id: learner.id, observer_id: current_observer.id)
		request.dastroy
		redirect_to observer_mypage_path(current_observer)
end
