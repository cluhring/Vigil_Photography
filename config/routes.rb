Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/portfolio'
  get 'static_pages/about_me'
  get 'static_pages/contact'
end
