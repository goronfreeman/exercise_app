Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users

  resources :exercises
  resources :exercise_sessions
end
