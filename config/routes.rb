Rails.application.routes.draw do

  # namespace :admin do
  # get 'managers/edit'
  # end
  #
  # namespace :admin do
  # get 'managers/create'
  # end
  #
  # namespace :admin do
  # get 'managers/destroy'
  # end

  root 'customer/restaurants#index'

  resources :sessions, only: [:new, :create, :destroy] # Yung

  namespace :customer do #Phil
    root '/customer/customers#show'
  end

  namespace :manager, shallow: true do
    root 'restaurants#show'
    resource(:restaurant, only:[:edit, :show, :update]) do
      resources(:reservations, only: []) do #Rich
        member do
          post 'approve'
          post 'reject'
        end
      end
    end

  end

  namespace :admin do
    root 'admin#index'
    resources :users
    resources :restaurants, except: [:index]
    resources :managers, except: [:index]
  end

  scope module: 'customer' do
    resources :customers, except: [:index] do
      resources :reservations, only: [:index, :show, :edit, :update] do
        member do 
          patch 'cancel'
        end
      end
    end
    resources :restaurants, only: [:index, :show] do
      resources :reservations, only: [:new, :create]
    end
  end

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

=begin
Sessions - Phil
  Handles log/log out.
Customer - Yung
  List of available restaurants.
  Sign-up for Customers
Reservations - Phil
  Create a reservation.
  View a reservation.
  Cancel a reservation.
Restaurant - Rich
  View reservations.
  Approve reservation.
  Decline reservation.
Admin - Rich
  List of all restaurants
  Approve or decline membership requests.
  Create admins and restaurant users.

=end