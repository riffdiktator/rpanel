Rpanel::Application.routes.draw do

  devise_for :user, :path => 'admin', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }

  root "pages#index"

  resources :pages, :realizations, only: [:index, :show]

  namespace :admin do
    root "pages#index"
    resources :pages, :realizations, :gallery, :photos
  end
end
