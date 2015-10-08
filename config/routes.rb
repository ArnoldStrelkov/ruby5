Rails.application.routes.draw do
  
  root 'application#posts'
  
  get  '/user/(:id)', to: 'application#posts'
  post  '/user/(:id)', to: 'application#posts'
 # get '/my', to: 'application#hello', as: 'app1'
 # post '/add', to: 'application#add', as: 'app'
  
  #get  '/new', to: 'application#new'
 # post '/new', to: 'application#add'
 # get  '/test', to: 'application#test'
 # get  '/test/:id', to: 'application#user_id'
 # post '/test/:id', to: 'application#post_ajax'
  
  
  post '/addpost', to: 'application#addpost'
  get  '/saved/(:id)', to: 'application#saved'
  post  '/saved/(:id)', to: 'application#saved'
  get  '/feed/(:id)', to: 'application#feed'
  post  '/feed/(:id)', to: 'application#feed'
  
  get  '/mail', to: 'application#mail' 
 
    
  resources :users
  match '/signup',  to: 'users#new',            via: 'get'
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  
  #get '/js', to: 'application#js'
  
  get ':controller/:action/:id/'
  post ':controller/:action/(:id)/'

#  генерация модели
#  $ rails generate model User name:string email:string
#  rails generate migration AddEmailToBases mail:string
#  rake routes
#   rake db:migrate

    
  
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
