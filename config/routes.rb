Rails.application.routes.draw do
  
  devise_for :users
  resources :users do
    collection do
      get 'search'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'hello/index' => 'hello#index'
  get 'hello/link' => 'hello#link'
   get 'hello/top' => 'hello#top'

  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]
  
  root 'hello#index'
  
end
