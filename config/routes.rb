Rails.application.routes.draw do
  
  root to: "homes#top"
  get 'home/about' => 'homes#about', as: 'about'
  devise_for :users
  resources :books, only: [:index, :show, :edit, :create, :destroy, :update]
  resources :users, only: [:show, :edit, :index, :create, :update]

   devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
