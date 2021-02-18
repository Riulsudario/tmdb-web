Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations'}

  root "home#index"

  resources :profiles do
  end

  resources :p do
    get :dashboard, controller: :home, action: :dashboard
    get :movie, controller: :movies, action: :show
    get :search, controller: :search, action: :index
    get :suggested, controller: :suggested, action: :index
    get :view_notification, controller: :notifications, action: :view_notification

    resources :schedule_movies do
    end

    resources :collections do
    end

    resources :watchlists do
      delete :delete, action: :delete
    end

    resources :watchedlists do
    end
  end

end
