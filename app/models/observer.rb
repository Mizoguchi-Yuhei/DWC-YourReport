class Observer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def already_follow_requested?(learner)
    self.follow_requests.exists?(learner_id: learner.id)
  end
end
