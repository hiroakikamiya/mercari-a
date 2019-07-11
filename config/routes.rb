Rails.application.routes.draw do
  root "items#index"
  resources :items, only: [:index, :show, :new, :create, :edit, :update] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_grandchild_ids', defaults: { format: 'json' }
    end
  end
  namespace :users do
    resources :registrations do
      collection do
        get 'basic_information'
        get 'phone_number'
      end
    end
  end
end
