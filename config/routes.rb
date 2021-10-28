Rails.application.routes.draw do
  root to: "home#index"
  resources :books, only: %i[index show] do
    collection do
      get "search"
    end
  end
  resources :publishers, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
