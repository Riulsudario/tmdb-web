Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations'}

  root "home#index"

  get :dashboard, controller: :home, action: :dashboard
end
