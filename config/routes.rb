Rails.application.routes.draw do
  namespace :admin do
    get 'customer/index'
  end

  namespace :admin do
    get 'customer/show'
  end

  namespace :admin do
    get 'customer/new'
  end

  namespace :admin do
    get 'customer/edit'
  end

  root   'admin/dashboard#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get    '/logout',  to: 'sessions#destroy'

  namespace :admin do
    get 'dashboard/index'

    resources :customer
  end

end
