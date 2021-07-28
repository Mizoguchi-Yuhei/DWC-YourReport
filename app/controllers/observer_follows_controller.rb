class ObserverFollowsController < ApplicationController
	def index
		@followers = current_learner.observer_follows.all
	end

	# フォロー解除
	def destroy
		follow = ObserverFollow.find(params[:id])
		follow.destroy
		redirect_to learner_mypage_path(current_learner)
	end
end
