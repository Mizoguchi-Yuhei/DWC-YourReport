class FollowRequest < ApplicationRecord
	belongs_to :learner
	belongs_to :observer
end
