Rails.application.routes.draw do
  root "items#index"
  resources :items, only: [:index, :show, :new, :edit]

  namespace :users do
    resources :registrations do
      collection do
        get 'step1'
        get 'step2'
        get 'step3'
        get 'step4'
      end
    end
  end
end
