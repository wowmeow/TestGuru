Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: { sing_in: :login, sing_out: :logout },
                     controllers: { session: 'sessions' }

  resources :badges, only: :index
  resources :user_badges, only: :index

  resources :gists, only: :create

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :badges, shallow: true

    resources :gists, only: :index
  end
end
