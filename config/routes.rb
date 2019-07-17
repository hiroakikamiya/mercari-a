Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  root "items#index"
  resources :items, only: [:index, :show, :new, :create, :edit, :update] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_grandchild_ids', defaults: { format: 'json' }
      get "/buy/:id", to: "items#buy", as: "buy"
      patch "/buy/:id", to: "items#buy_update", as:"update"
      get 'edit_category_children', defaults: { format: 'json' }
      get 'edit_category_grandchildren', defaults: { format: 'json' }
      get 'edit_category_grandchild_id', defaults: { format: 'json' }
    end
  end

    devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  devise_scope :user do
  get "user", :to => "users/registrations#index"
  get "user/basic", :to => "users/registrations#basic"
  get "user/phone_number", :to => "users/registrations#phone_number"
  get "user/address", :to => "users/registrations#address"
  get "user/card", :to => "users/registrations#card"
  end

  resources :card, only: [:new, :show] do
    collection do
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

end
