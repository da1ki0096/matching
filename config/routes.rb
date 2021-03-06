Rails.application.routes.draw do
  get 'group_members/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :groups do
    resources :messages, only: [:index, :create]
    member do
      post 'join'
    end
  end
  resources :groupmembers
end
