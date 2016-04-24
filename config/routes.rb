Rails.application.routes.draw do

# user
  get '/users/:id' => 'users#show'
  get '/users' => 'users#index'
  patch '/users/:id' => 'users#update'
  put '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'

# groups

  # get '/users/:user_id/groups/:id' => 'groups#show'
  # get '/users/:user_id/groups' => 'groups#index'
  # patch '/users/:user_id/groups/:id' => 'groups#update'
  # put '/users/:user_id/groups/:id' => 'groups#update'
  # delete '/users/:user_id/groups/:id' => 'groups#destroy'

# circuits

  # get '/users/:user_id/circuits/:id' => 'circuits#show'
  get '/users/:user_id/circuits' => 'circuits#index'
  # patch '/users/:user_id/circuits/:id' => 'circuits#update'
  # put '/users/:user_id/circuits/:id' => 'circuits#update'
  # delete '/users/:user_id/circuits/:id' => 'circuits#destroy'

  resources :groups, :circuits

  devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations' }


  root 'welcome#index'


  #  ========= MEMO =======

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
