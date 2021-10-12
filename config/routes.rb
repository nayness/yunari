Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get 'pages/home'
  get 'personajes/:slug', to: 'characters#public_info', as: 'personajes'
  resources :characters do
    collection do
      get :search_slug
    end
  end
  resources :races
  resources :kinds
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
