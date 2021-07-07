class Test < ApplicationRecord
  belongs_to :learner
  has_many :subjects, dependent: :destroy
  accepts_nested_attributes_for :subjects, reject_if: :all_blank, allow_destroy: true
  validates_associated :subjects

  # refile
  attachment :image
end
