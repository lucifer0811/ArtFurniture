require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  root "static_pages#home"
  get  "static_pages/about"
  get "static_pages/help"
  get "static_pages/contact"
  namespace :admin do
  	resources :users, except: :edit
  end
  resources :users, except: :destroy
  resources :posts
  devise_for :users, path: 'auth', path_names: { sign_in: 'login',
    sign_out: 'logout', password: 'secret', confirmation: 'verification',
    unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' },
    :controllers => { omniauth_callbacks: "omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
