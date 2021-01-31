Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations'}

  root "home#index"

  get :profiles, controller: :profiles, action: :index

  resources :p do
    get :dashboard, controller: :home, action: :dashboard
    get :movie, controller: :movies, action: :show
    get :search, controller: :search, action: :index
  end

end
