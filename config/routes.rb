Rails.application.routes.draw do
  get 'about_us/index'
  get 'about/index'
  root to: "home#index"
  resources :authors, only: %i[index show]
  resources :books, only: %i[index show] do
    collection do
      get "search"
    end
  end
  resources :publishers, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
