class Learner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tests, dependent: :destroy
  accepts_nested_attributes_for :tests, reject_if: :all_blank, allow_destroy: true

  has_many :goals, dependent: :destroy

  has_many :follow_requests, dependent: :destroy
  has_many :observer_follows, dependent: :destroy

  def self.search(keyword)
    @learner = Learner.where("name LIKE ?", "%#{keyword}%")
  end
end
