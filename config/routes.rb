Rails.application.routes.draw do
  root "items#index"
  resources :items, only: [:index, :show, :new, :create, :edit] do
    collection do
      get 'search'
    end
  end
end
