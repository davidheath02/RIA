Crawler::Application.routes.draw do
  
  
  
  get "/co_sizes/group_size"
  
  get 'user_industries/search'

# get 'user_industries/search'
  
  get "site/home"

  get "site/statistics"


  get "/positions/position_stats"
  
  get "/locations/location_stats"
  get "/locations/map"
  
  get "/user_industries/industry_stats"
  
  get "/companies/company_stats"
  
  get "/co_sizes/size_stats"
 
  get "/users/stats"
  
  
  match '/statistics' => 'site#statistics'
  match '/home' => 'site#home'
  
  
  
  resources :users
  resources :companies
  resources :co_sizes
  resources :locations
  resources :user_industries
  resources :titles
  resources :connections
  resources :positions
 
  
  #root :to => 'site#home'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  
  
 
  #root :to => 'companies#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
