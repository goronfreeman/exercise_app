Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users

  resources :exercises do
    resources :exercise_sessions
  end
end
