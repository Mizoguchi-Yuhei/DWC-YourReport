class DailyScore < ApplicationRecord
	validates :name, presence: true
	validates :score, presence: true
	
	belongs_to :daily_test
end
