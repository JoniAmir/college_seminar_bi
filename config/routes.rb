College::Application.routes.draw do

  # ActiveAdmin.routes(self)
  # devise_for :admin_users, ActiveAdmin::Devise.config

  # The priority is based upon order of creation:
  # first created -> highest priority.
  
  # First priority
  root :to => "dashboard#home"
  match 'check' => 'nominees#new'
  match 'dashboard' => 'dashboard#index'
  match 'about' => "dashboard#about"
  
  
  # match 'graduate/import/:id' => 'graduates#import'
  # match 'graduate/delete_all' => 'graduates#delete_all'
  # match 'excel/:type/:id' => 'excels#show'
  # match 'graduate_profession/import/:id' => 'graduate_professions#import'
  # match 'graduate_profession/delete_all' => 'graduate_professions#delete_all'


  # match 'student/import_all' => 'students#import_all'
  # match 'student/import/:id' => 'students#import'
  # match 'student/delete_all' => 'students#delete_all'
  # match 'student/delete/:id' => 'students#delete'


    # TODO: clean duplicate resources
  # resources :excels
  # resources :students
  # resources :graduate_professions
  # resources :graduates
  # resources :nominees




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
