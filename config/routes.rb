Rails.application.routes.draw do
  resources :images, except: [:index]
  devise_for :users, :controllers => { :registrations => 'registrations' }
  root 'welcome#index'
  resources :users, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
