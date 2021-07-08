class Observer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :follow_requests, dependent: :destroy
  has_many :observer_follows, dependent: :destroy

  def already_follow_requested?(learner)
    self.follow_requests.exists?(learner_id: learner.id)
  end

  def already_followed?
    self.observer_follows.exists?(learner_id: learner.id)
  end
end
