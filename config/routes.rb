Rails.application.routes.draw do
  get 'publishers/index'
  get 'publishers/show'
  resources :books, only: %i[index show]
  resources :publishers, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
