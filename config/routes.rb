Proofing::Application.routes.draw do



  resources :subcategories, :path => "vendor"


  resources :client_videos


  resources :photo_packages


  resources :videos
  match '/cinematography', to: 'videos#index'


  # resources :weddings


  resources :client_images do
    collection do
      delete 'destroy_multiple'
    end
  end


  resources :blog_images


  resources :galleries


  get "client_portal/index"

  devise_for :users do 
	    match 'user' => "client_portal#index", :as => :user_root
  end
     

  resources :categories


  root :to => 'custom#home'

  resources :comments
  match '/weddings' => 'posts#index'
  match '/vendors' => 'categories#index'  
  match '/blog' => 'posts#index'
  match '/unpublished', to: 'posts#unpublished'
  match '/scheduled', to: 'posts#scheduled'
  
  resources :posts # do
  
      # post :add_files, :on => :member
  # end
  match '/client_portal', to: 'client_portal#index'
  # match '/edit_password', to: 'client_portal#edit_password'
  match '/cinema', to: 'client_portal#cinema'
  match '/tips', to: 'client_portal#tips'
  match '/settings', to: 'client_portal#settings'
  match '/mywedding', to: 'client_portal#mywedding'
  
  match '/home', to: 'custom#home'
  match '/aboutus', to: 'custom#aboutus'
  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post


  get '/clienthome', to: 'custom#clienthome'
  
  
  resources :users


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
   # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
