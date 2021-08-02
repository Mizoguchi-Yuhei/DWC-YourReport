class ObserverEvent < ApplicationRecord
	validates :title, presence: true

	belongs_to :observer
end
