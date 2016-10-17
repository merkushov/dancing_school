Rails.application.routes.draw do

  root   'admin/dashboard#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get    '/logout',  to: 'sessions#destroy'

  namespace :admin do
    get 'dashboard/index'

    resources :customers
    resources :class_schedules
    resources :class_types
  end

  # хак TODO: разобраться почему не работает вызов DELETE
  get "/admin/class_schedules/:id/delete", to: "admin/class_schedules#destroy", as: "delete_admin_class_schedule"
  get "/admin/class_types/:id/delete", to: "admin/class_types#destroy", as: "delete_admin_class_type"

end
