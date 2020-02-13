Rails.application.routes.draw do
  root 'homepage#index'
  get 'test', to: 'homepage#test'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
     get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'cameras/list'
  get 'cameras/map'
  resources :cameras, only: [:index, :show, :create, :destroy]
end
