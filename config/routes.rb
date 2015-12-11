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


 get '/users/upgrade' => 'users#upgrade'
 
  #ver solicitudes aceptadas entre dos fechas
  get '/buscar_solicitudes' => 'users#buscar_solicitudes'
  get '/solicitudes_aceptadas' => 'users#solicitudes_aceptadas'
  
  #ver ganancias entre dos fechas
  get '/users/buscar_ganancias' => 'users#buscar_ganancias'
  get '/ganancias' => 'users#ganancias'
  post '/ganancias' => 'users#ganancias'

 get '/search' => 'hospedajes#search'
 get '/search/hospedajes' => 'hospedajes#consulta'

  #ver los hospedajes de un usuario
  get '/users/:id/hospedajes' => 'users#hospedajes'

 #post 'hospedajes/:id' , to: 'hospedajes#show'
post 'hospedajes/:id/aceptar', to: 'reservas#aceptar'
get 'hospedajes/:id/aceptar', to: 'reservas#aceptar'
post 'hospedajes/:id/rechazar', to: 'reservas#rechazar'
get 'hospedajes/:id/rechazar', to: 'reservas#rechazar'
get 'reservas/index_hospedajes', to: 'reservas#index_hospedajes'
 #agrego esto  por este problema:
 #No route matches {:action=>"edit", :controller=>"account_activations", :email=>"ani_bellas@hotmail.com", :id=>nil} missing required keys: [:id]
 #get 'account_activation' => 'account_activations#edit', :as => :edit_account_activation



 resources :users
 resources :account_activations, only: [:edit]
 resources :password_resets, only: [:new, :create, :edit, :update]
 resources :hospedajes
 resources :tipos
 resources :reservas
 resources :credit_cards
 resources :hospedajesfeedbacks
 resources :user_feedbacks
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
