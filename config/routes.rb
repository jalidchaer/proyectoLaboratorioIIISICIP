Rails.application.routes.draw do
  get 'investigador/index'

  get 'investigador/registrar_proyecto'

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'perfil/index'

  get 'registrar_informe/index'

  get 'registrar_area_investigacion/index'

  get 'inicio/index'

  resources :evaluadores
  resources :evaluadors
  get 'form/indez'

  get 'evaluadores/evaluar_proyecto'

  resources :evaluadors
  get 'registrar_rol/index'

  get 'avalar_proyecto/index'

  
  resources :proyects
  get 'cierre_proyecto/index'

  get 'convocatoria/index'

  get 'registrar_area_investigacion/index'

  get 'generar_solvencia/index'

  get 'registrar_tipo_proyecto/index'

  get 'prorroga_proyecto/index'

  get 'generar_credencial/index'

  get 'modal/index'
  
  get 'modal2/index'



  get 'registrar_informe/index'

  get 'asignacion_evaluadores/datos_proyecto'


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/registrar_proyecto' => 'investigador#registrar_proyecto'

  #get '/registrar_proyecto' => 'proyectos#registrar_proyecto'

  get '/mostrar_proyectos' => 'investigador#mostrar_proyectos'

  get '/ver_proyecto' => 'investigador#show'
  #get 'formulario/index'

  #get 'evaluador/index'

  #get 'principal/index'

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

  resources :users
  resources :proyectos
  resources :investigador
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

match 'proyectos/:id' => 'proyectos#show', via: :get
get 'proyectos/:id' => 'proyectos#show'





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
   get ':controller(/:action(/:id))(.:format)'
  post ':controller(/:action(/:id))(.:format)'
end
