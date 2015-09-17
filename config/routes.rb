Rails.application.routes.draw do
  root 'static_pages#home'
  get 'portfolio' => 'static_pages#portfolio'
  get 'about_me' => 'static_pages#about_me'
  get 'faqs' => 'static_pages#faqs'
  get 'contact' => 'guests#index'
  post 'contact' => 'guests#create'
  resources :users, only: [:index, :new, :show, :create]
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
