class LearnerEvent < ApplicationRecord
	validates :title, presence: true

	belongs_to :learner
end
