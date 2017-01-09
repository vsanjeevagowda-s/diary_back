Rails.application.routes.draw do
  devise_for :users, skip: [:sessions, :registrations]

  as :user do
    post '/api/login' => 'sessions#create'
    post '/api/logout' => 'sessions#logout'
    post '/api/create/user' => 'users#create'
  end

# resources :records

post '/record/list' => 'records#index'
post '/record/create' => 'records#create'

post '/expense/create' => 'expenses#create'
post '/expense/list' => 'expenses#todays_expense'



       #     records GET    /records(.:format)             records#index

       #             POST   /records(.:format)             records#create

       #  new_record GET    /records/new(.:format)         records#new

       # edit_record GET    /records/:id/edit(.:format)    records#edit

       #      record GET    /records/:id(.:format)         records#show

       #             PATCH  /records/:id(.:format)         records#update


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
