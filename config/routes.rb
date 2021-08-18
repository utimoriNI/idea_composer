Rails.application.routes.draw do
  root   'static_pages#home'
  get    'static_pages/home'
  get    'static_pages/help'
  get    'sessions/new'
  get    '/signup', to: 'users#new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
