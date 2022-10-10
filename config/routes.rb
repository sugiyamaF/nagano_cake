Rails.application.routes.draw do
  namespace :admin do
    resources :order_details
    resources :orders
    resources :customers
    resources :genres
    resources :items
    resources :homes
  end
  namespace :public do
    resources :addresses

    resources :orders
    get 'orders/comfirm'
    get 'orders/complete'

    resources :cart_items
    get 'cart_items/destroy_all'

    resources :customers
    get 'customers/unsubscribe'
    get 'customers/withdraw'

    resources :homes
    resources :items
  end
  

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
