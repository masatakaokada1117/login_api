Rails.application.routes.draw do
  resources :users
  resources :memos
  post 'login/login'
end
