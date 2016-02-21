Rails.application.routes.draw do
  mount Commontator::Engine => '/commontator'
  resources :uploads
  get 'show' => 'uploads#edit'
  #get 'upload'  => 'uploads#show' 

  resources :users
  root 'sessions#new'
  get 'signup'  => 'users#new' 
  get 'login'  => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
end
