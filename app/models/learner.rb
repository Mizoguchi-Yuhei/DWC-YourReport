class Learner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tests, dependent: :destroy
  # accepts_nested_attributes_for :tests, reject_if: :all_blank, allow_destroy: true
  has_many :goals, dependent: :destroy

end
