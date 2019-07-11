Rails.application.routes.draw do
  root "items#index"
  resources :items, only: [:index, :show, :new, :create, :edit] do
    collection do
      get 'search'
    end
  end

    devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  
  devise_scope :user do
  get "user", :to => "users/registrations#index"
  get "user/basic", :to => "users/registrations#basic"
  get "user/phone_number", :to => "users/registrations#phone_number"
  get "user/address", :to => "users/registrations#address"
  get "user/card", :to => "users/registrations#card"
  end

end
