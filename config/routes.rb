Rails.application.routes.draw do
  get 'sessions/new'
  get  '/signup',  to: 'users#new'
  post  '/signup', to: 'users#create'
  get 'static_pages/home'
  get    '/login',   to: 'sessions#login'
  post   '/login',   to: 'sessions#logining'
  post   '/login',   to: 'sessions#login'
  delete '/logout',  to: 'sessions#logout'
  resources :users
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
