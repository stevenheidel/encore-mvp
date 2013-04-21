EncoreMvp::Application.routes.draw do
  root :to => 'welcome#index', :as => :new_user_session # home is also login

  resources :concerts, :only => [:index, :show]

  get 'profile' => 'welcome#profile'

  post 'signup' => 'users#signup'

  # route for Users and Facebook login
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    #get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  # crutch to fix sign_out error
  match "sign_out" => redirect("/")

  # routes for Active Admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end