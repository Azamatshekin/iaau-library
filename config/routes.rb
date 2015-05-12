Rails.application.routes.draw do
  get 'upload/upload_page'

  get 'upload/pdf'

  get 'public/AccessDenied'

  get 'public/Unauthorized'

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'home/index'

  get 'home/aboutDevelopers'

  get 'home/contact'

  get 'home/portfolio'

  get 'home/aboutRuby'

  get 'home/aboutMe'

  get 'users/new'

  get 'signup'  => 'users#new'

  get   'access_denied'   => 'public#AccessDenied'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  post   'upload'   => 'upload#uploadFile'

  resources :categories
  resources :statuses
  resources :book_types
  resources :books
  resources :readers
  resources :book_in_uses
  resources :providers
  resources :book_by_providers
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  root 'home#index'

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
