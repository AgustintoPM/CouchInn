Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

 root 'hospedajes#index'



 get 'help' => 'static_pages#help'

 get 'about' => 'static_pages#about'

 get 'contact' => 'static_pages#contact'

 get 'home' => 'static_pages#home'

 get 'signup' => 'users#new'

 get 'login' => 'sessions#new'

 post 'login' => 'sessions#create'

 delete	'logout' => 'sessions#destroy'
  
 get '/users/showPremium' => 'users#showPremium'

 put '/users/quitPremium' => 'users#quitPremium'

 get '/users/showUpgrade' => 'users#showUpgrade'
 
 put '/users/upgrade' => 'users#upgrade'

  get '/search' => 'hospedajes#search'
  get '/search/hospedajes' => 'hospedajes#consulta'



 #post 'hospedajes/:id' , to: 'hospedajes#show'
post 'hospedajes/:id/aceptar', to: 'reservas#aceptar'
get 'hospedajes/:id/aceptar', to: 'reservas#aceptar'
post 'hospedajes/:id/rechazar', to: 'reservas#rechazar'
get 'hospedajes/:id/rechazar', to: 'reservas#rechazar'
 #agrego esto  por este problema:
 #No route matches {:action=>"edit", :controller=>"account_activations", :email=>"ani_bellas@hotmail.com", :id=>nil} missing required keys: [:id]
 #get 'account_activation' => 'account_activations#edit', :as => :edit_account_activation



 resources :users
 resources :account_activations, only: [:edit]
 resources :password_resets, only: [:new, :create, :edit, :update]
 resources :hospedajes
 resources :tipos
 resources :reservas
  


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
