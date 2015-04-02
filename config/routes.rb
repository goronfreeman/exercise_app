Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users

  shallow do
    resources :exercises do
      resources :exercise_sessions do
        resources :exercise_sets
      end
    end
  end
end
