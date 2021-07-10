Rails.application.routes.draw do
  namespace :observer do
    get 'learners/show'
  end
  get 'home/index'
  root to: "home#index"

  get "/learner/mypage" => "learner#show"
  namespace :learner do
    resources :tests
    resources :goals
  end
# 学習者ログイン
  # devise_for :learners
  devise_for :learners, :controllers => {
    :registrations => 'learners/registrations',
    :sessions => 'learners/sessions'
  }

  devise_scope :learner do
    get "sign_in", :to => "learners/sessions#new"
    post "sign_in", :to => "learners/sessions#create"
    get "sign_out", :to => "learners/sessions#destroy"
  end

  # 学習者側フォロー関係
  resources :learners, only: [:show, :edit, :update] do
    resources :observer_follows, only: [:destroy, :show, :index]
    post "/follow_requests/:id" => "learner/follow_requests#allow", as: "allow"
    resources :follow_requests, only: [:index, :show, :destroy]
  end

# 保護者ログイン
  devise_for :observers, :controllers => {
    :registrations => 'observers/registrations',
    :sessions => 'observers/sessions'
  }

  devise_scope :observer do
    get "sign_in", :to => "observers/sessions#new"
    post "sign_in", :to => "observers/sessions#create"
    get "sign_out", :to => "observers/sessions#destroy"
  end

  get "/observer/mypage" => "observer#show"
  get "/observer/search" => "observer#search"
  namespace :observer do
    resources :learners, only: [:show] do
      resource :follow_requests, only: [:create, :destroy]
    end
  end

  # namespace :learner do
  #   get 'follow_requests/index'
  # end
  # namespace :observer do
  #   get 'observer/show'
  # end
end
