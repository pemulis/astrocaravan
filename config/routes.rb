require 'api_constraints'

Hackonauts::Application.routes.draw do
  get "subscriptions/new"
  get "subscriptions/create"
  get "subscriptions/destroy"
  use_doorkeeper
  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, contraints: ApiConstraints.new(version: 1, default: true) do
      resources :projects
      resources :events
    end
  end

  get "home/index"
  concern :commentable do
    resources :comments
  end

  concern :subscribable do
    resources :subscriptions, only: [:new, :create, :destroy]
  end

  devise_for :users
  get "sessions/create"
  get "sessions/destroy"
  root to: 'home#index'

  resources :users
  resources :events, concerns: [:commentable, :subscribable] 
  resources :projects, concerns: [:commentable, :subscribable]

  get 'project-tags/:tag', to: 'projects#index', as: :project_tag
  get 'event-tags/:tag', to: 'events#index', as: :event_tag

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root to: 'welcome#index'

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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
