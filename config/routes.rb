Rails.application.routes.draw do
  resources :users, only: [:show, :edit, :index]
  resources :books, only: [:new, :index, :show, :edit]
  get 'homes/top'
  devise_for :users
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
