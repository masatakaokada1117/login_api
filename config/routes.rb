Rails.application.routes.draw do
  resources :users
  resources :memos
  resources :passwords, only: %i[create edit update]
  post 'login/login'

  # LetterOpenerWeb::Engineをマウントする
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
