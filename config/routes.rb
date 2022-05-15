Rails.application.routes.draw do
  get 'books/show'
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:new, :index, :show]
  get 'homes/about' => 'homes#about',as:'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
