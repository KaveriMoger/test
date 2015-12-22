Project1::Application.routes.draw do
  
  
  
  
  #get "sessions/new"
  devise_for :users
  #devise_for :users
  
  #get "clients/index"
  get "clients/new" => "clients#new"
  post "clients/create" => "clients#create"
  post "clients/:id"    => "clients#show"
  get "documents/new" => "documents#new"
  post "documents/create" => "documents#create"
  post "documents/show"   => "documents#show"
  #get "/sessions/new" => "sessions#new"
  get "/users/sign_in" => "sessions#new"
  post "/users/sign_in" => "devise/sessions#create"
  delete "/users/sign_out" => "devise/sessions#destroy"
  get "/users/sign_up" => "devise/registrations#new"
  post "/users/edit" => "devise/registrations#edit"
   
  get  "/users/password/new" => "devise/passwords#new"
  get   "/users/password/edit" => "devise/passwords#edit"
  patch "/users/password/"     =>  "devise/passwords#update"
  put   "/users/password"  =>     "devise/passwords#update"
  get   "/users/cancel"  =>  "devise/registrations#cancel"
  post  "/users/create"      => "devise/registrations#create"
  patch  "/users/:id/update"     => "devise/registrations#update"
  put    "/users/update"     => "devise/registrations#update"
  delete "/users/destroy"     => "devise/registrations#destroy"
  #root to: "home#index"
  resources :clients, :documents, :teams, :users, :roles,:user_auths, :role_auths
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
