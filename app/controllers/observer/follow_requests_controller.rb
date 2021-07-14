class Observer::FollowRequestsController < ApplicationController
	def create
		learner = Learner.find(params[:learner_id])
		request = current_observer.follow_requests.new(learner_id: learner.id, observer_id: current_observer.id)
		request.save
		redirect_to observer_search_path
	end

	def destroy
		learner = Learner.find(params[:learner_id])
		request = current_observer.follow_requests.find_by(learner_id: learner.id, observer_id: current_observer.id)
		request.destroy
		redirect_to observer_search_path
	end
end
