Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    resources :homes, :items, :genres, :customers, :orders, :order_details
  end
  scope module: :public do
    resources :items, :customers, :cart_items, :orders, :addresses
    root to: "homes#top"
    get '/about' => 'homes#about'
    post 'orders/comfirm'
    get 'orders/complete'

    delete 'cart_items/destroy_all'

    get 'customers/unsubscribe'
    patch 'customers/withdraw'
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
