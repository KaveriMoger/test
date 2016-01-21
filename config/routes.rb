Project1::Application.routes.draw do


  get "test" => "teams"
  get "test1" => "teams"
  get "test2" => "teams#test2"


  get "homes/new"
  #get "password_resets/new"
  #get "sessions/new"
  #get "users/new"
  #get "sessions/new"
  #devise_for :users, controllers: { registrations: 'users/registrations', passwords: 'users/passwords'}
  #devise_for :users

  #get "clients/index"
  get "clients/new" => "clients#new"
  post "clients/create" => "clients#create"
  post "clients/:id/show"    => "clients#show"
  post "clients/edit" => "clients#edit"
  post "clients/destroy" => "clients#destroy"

  #get "documents/new" => "documents#new"
  post "teams/edit" => "teams#edit"
  post "teams/show" => "teams#show"
  post "teams/destroy" =>"teams#destroy"
  post "documents/create" => "documents#create"
  post "documents/show"   => "documents#show"
  post "documents/edit" => "documents#edit"
  post "documents/destroy" => "documents#destroy"
  post "users/edit" => "users#edit"
  post "users/destroy"=>"users#destroy"
  post "roles/edit" => "roles#edit"
  post "roles/destroy" => "roles#destroy"
  # post "documents/home" => "documents#home"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  get "home"  => "documents#home", :as => "home"
  #root :to => "users#new"
  post "documents/download_file" => "documents#download_file"
  resources :clients, :documents, :teams, :users, :roles, :sessions,:password_resets

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'sessions#new'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
