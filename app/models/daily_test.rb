class DailyTest < ApplicationRecord
	validates :name, presence: true

  belongs_to :learner
  has_many :daily_scores, dependent: :destroy
  accepts_nested_attributes_for :daily_scores, reject_if: :all_blank, allow_destroy: true
  validates_associated :daily_scores
end
