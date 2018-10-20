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
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end

end


#resources :questions, shallow: true, except: :index do
#        resources :answers, shallow: true, except: :index
#      end
