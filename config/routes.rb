Rails.application.routes.draw do
  resources :categories
  root to: 'pages#home'

  get 'pages/home'
  get 'pages/about' => 'pages#about', as: :about

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]
  resources :events do
    resources :registrations, only: [:create]
  end

  resources :profiles, only: [:new, :edit, :create, :update]
  resources :photos

end
