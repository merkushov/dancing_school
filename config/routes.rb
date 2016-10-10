Rails.application.routes.draw do

  root   'admin/dashboard#index'

  namespace :admin do
    get 'dashboard/index'
  end

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get    '/logout',  to: 'sessions#destroy'

end
