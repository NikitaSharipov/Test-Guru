Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout}, controllers: { sessions: 'sessions' }

  get 'sessions/new'
  get 'users/new'

  root to: 'tests#index'

  resources :answers

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  resources :feedbacks, only: [:new, :create]
  resources :badge_receptions, only: :index

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: :index
    resources :badges
  end

end


#resources :questions, shallow: true, except: :index do
#        resources :answers, shallow: true, except: :index
#      end
