Rails.application.routes.draw do
  resources :weeks
  # ------------------------------- Devise Routes -------------------------------------- #
  devise_for :users, skip: [:registrations]

  # ----------------------------------  Route ------------------------------------------ # 
  root to: "users#home"

  # ------------------------- Root when exist Current User ----------------------------- #
  resources :teacher_by_matters
  resources :matters
  resources :scheduleds
  resources :semesters
  resources :rooms
  resources :notifications
  resources :devices
  resources :apps
  resources :rols
  resources :users

  # -------------------------------------- Matches -------------------------------------- #
  match '/home', to: 'users#home', via: :get, as: :home
  match '/users', to: 'users#index', via: :get, as: :users_index

  namespace :api do
    namespace :v1 do
      match 'sign_in/mobile', to: 'users#sign_in_user', via: :post
      match 'return/matters', to: 'users#get_matters', via: :post
    end
  end
end
