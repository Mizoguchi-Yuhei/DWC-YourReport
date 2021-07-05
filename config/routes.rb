Rails.application.routes.draw do
  get 'home/index'
  root to: "home#index"

  # devise_for :learners
  devise_for :learners, :controllers => {
    :registrations => 'learners/registrations',
    :sessions => 'learners/sessions'
  }

  devise_scope :learner do
    get "sign_in", :to => "learners/sessions#new"
    get "sign_out", :to => "learners/sessions#destroy"
  end
end
