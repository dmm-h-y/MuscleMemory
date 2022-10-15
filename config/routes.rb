Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  resources :muscles do
    resources :muscle_comments, only: [:create, :destroy]
  end
  resources :users
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
