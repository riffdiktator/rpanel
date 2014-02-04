Rpanel::Application.routes.draw do

  get "pages/index"
  devise_for :users

  root "pages#index"

  resources :pages, :realizations, only: [:index, :show]

  namespace :admin do
    root "pages#index"
    resources :pages, :realizations, :gallery, :photos
  end
end
