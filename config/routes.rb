Rails.application.routes.draw do
  root 'pages#home'
  resources :users, only: [] do
    member do
      get :profile
      get :edit_account
      put :update_account
    end
  end
  devise_for :users, path: 'users', controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  get 'pages/home'
  get 'personajes/:slug', to: 'characters#public_info', as: 'personajes'
  resources :characters do
    collection do
      get :search_slug
    end
  end
  resources :races
  resources :kinds

  devise_for :api_users, controllers: { sessions: 'api_users/sessions', registrations: 'api_users/registrations' }

  namespace :api do
    namespace :v1 do
      get 'personajes/:slug', to: 'characters#show'
      post 'personajes', to: 'characters#create'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
