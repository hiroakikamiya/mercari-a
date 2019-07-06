Rails.application.routes.draw do
  root "items#index"
  resources :items, only: [:index, :show, :new, :create, :edit, :search]

  namespace :users do
    resources :registrations do
      collection do
        get 'basic_information'
        get 'phone_number'
      end
    end
  end
end
