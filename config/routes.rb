Rails.application.routes.draw do


 
  scope module: :public do
    get 'orders/complete' => "orders#complete"
    post 'orders/confirm' => "orders#confirm"
    resources :orders, only: [:new, :index, :show, :create]
  end
  scope module: :public do
    delete 'cart_items/destroy_all' => "cart_items#destroy_all"
    resources :cart_items, only: [:index, :create, :update, :destroy]

  end

  scope module: :public do
    resources :addresses, only: [:index, :create, :destroy, :edit, :update]
  end

   root to: 'public/homes#top'
    get 'about' => 'public/homes#about'


    get 'customers/my_page' => "public/customers#show"
    get 'customers/edit' => "public/customers#edit"
    patch 'customers' => "public/customers#update"
    get 'customers/leave' => "public/customers#leave"
    patch 'customers/withdraw' =>"public/customers#withdraw"

  scope module: :public do
    resources :items, only: [:index, :show]
  end

  namespace :admin do
    resources :orders, only: [:show]
  end

  namespace :admin do
    resources :items, only: [:index, :new, :create, :edit, :show, :update]
  end

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end

  namespace :admin do
    get '' => "homes#top"
  end

  devise_for :admins,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
