Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations'}

  root "home#index"

  resources :profiles do
  end

  resources :p do
    get :dashboard, controller: :home, action: :dashboard
    get :movie, controller: :movies, action: :show
    get :search, controller: :search, action: :index

    resources :watchlists do
      delete :delete, action: :delete
    end

    resources :watchedlists do
      delete :delete, action: :delete
    end
  end

end
