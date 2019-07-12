Rails.application.routes.draw do
  resources :indentifies
  get '/thongtinsach', to: 'indentifies#index'
  get  '/nhandangmoi',  to: 'indentifies#new'
  get  '/sach',  to: 'indentifies#index_user'
  post  '/sach',  to: 'borrows#create'
  resources :books
  get  '/themmoi',  to: 'books#new'
  
  resources :borrow_details
  get  '/nguoimuonsach',  to: 'borrow_details#index'

  resources :borrows
  get '/muon', to: 'borrows#new'
  get '/create', to: 'borrows#create'
  get '/sachmuon', to: 'borrows#index'
  resources :catogaries
  get  '/loaimoi',  to: 'catogaries#new'

  get 'sessions/new'
  get  '/signup',  to: 'users#new'
  post  '/signup', to: 'users#create'
  get  '/index',  to: 'users#index' , as: :index
  get 'static_pages/home'
  get 'static_pages/help'
  get    '/login',   to: 'sessions#login' 
  post   '/login',   to: 'sessions#logining'
  delete '/logout',  to: 'sessions#logout'  
  # root 'indentifies#index'
  root 'static_pages#home'
  get  '/users/:id/admin_edit',  to:'users#admin_edit', as: :admin_edit_user
  resources :users
end
