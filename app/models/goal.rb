class Goal < ApplicationRecord
	validates :body, presence: true

	belongs_to :learner
end
