class Subject < ApplicationRecord
	validates :name, presence: true
	validates :score, presence: true
	validates :perfect, presence: true

  belongs_to :test
end
