Rails.application.routes.draw do
  root 'static_pages#home'
  get 'portfolio' => 'static_pages#portfolio'
  get 'about_me' => 'static_pages#about_me'
  get 'contact' => 'static_pages#contact'
  get 'faqs' => 'static_pages#faqs'
  resources :users, only: [:index, :new, :show, :create]
end
