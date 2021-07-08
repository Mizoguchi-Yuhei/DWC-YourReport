class Learner::ObserverFollowsController < ApplicationController
	def index
		@followers = current_learner.observer_follows.all
	end

	def destroy
		follow = ObserverFollow.find(params[:id])
		follow.destroy
		redirect_to learner_mypage_path(current_learner)
	end
end
