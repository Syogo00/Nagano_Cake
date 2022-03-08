Rails.application.routes.draw do


    get 'adresses/index' => "public/adresses#index"
    post 'adresses' => "public/adresses#create"
    delete 'adresses/destroy' => "public/adresses#destroy"
    get 'adresses/edit'

   root to: 'public/homes#top'
    get 'about' => 'public/homes#about'


    get 'customers/my_page' => "public/customers#show"
    get 'customers/edit' => "public/customers#edit"
    patch 'customers' => "public/customers#update"
    get 'customers/leave' => "public/customers#leave"
    patch 'customers/withdraw' =>"public/customers#withdraw"

    get 'items' => "items#index"
    get 'items/id' => "items#show"

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
