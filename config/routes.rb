Rails.application.routes.draw do
  resources :indentifies
  resources :books
  get  '/themmoi',  to: 'books#new'
  get  '/books',  to: 'books#index'
  get 'books/:id/edit', to:'books#edit'
  resources :borrow_details
  get  '/nhandangmoi',  to: 'indentifies#new'

  resources :borrows

  resources :catogaries
  get  '/loaimoi',  to: 'catogaries#new'

  get 'sessions/new'
  get 'static_pages/home'
  get 'static_pages/help'

  resources :users
  get  '/signup',  to: 'users#new'
  post  '/signup', to: 'users#create'
  get  '/index',  to: 'users#index' , as: :index
  get    '/login',   to: 'sessions#login' 
  post   '/login',   to: 'sessions#logining'
  delete '/logout',  to: 'sessions#logout'  
  root 'static_pages#home'
  get  '/users/:id/admin_edit',  to:'users#admin_edit', as: :admin_edit_user
end
