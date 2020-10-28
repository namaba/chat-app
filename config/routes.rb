Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: 'welcome#index'
  root 'rooms#index'

  # resourcesを使うとRESTfulなURLを自動生成できる
  resources :rooms, only: %i[show create]
  resources :users, only: %i[index]
  resources :messages, only: %i[destroy]
end
