Rails.application.routes.draw do
  resources :styles
  get 'home/index'

  get 'styles/index'

  root to: "home#index"

  devise_scope :user do
    get '/users/sign_up' => 'devise/registrations#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_for :users, controllers: {
    registration: 'users/registration'
  }
end
