Rails.application.routes.draw do

  root   'admin/dashboard#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get    '/logout',  to: 'sessions#destroy'

  namespace :admin do
    get 'dashboard/index'

    resources :customers do
      collection do
        get :search, to: :search
      end
    end
    resources :class_schedules
    resources :class_types
    resources :locations
    resources :halls

    # resources :visits
    get     'class_schedules/:class_schedule_id/visits', to: 'visits#list_by_class_schedule', as: 'class_schedule_visits'
    post    'visits',     to: 'visits#create',  as: 'visits'
    match   'visits/:id', to: 'visits#update', via: [:patch, :put],  as: :visit
    delete  'visits/:id', to: 'visits#destroy', as: 'visit_delete'
  end

  # хак TODO: разобраться почему не работает вызов DELETE
  get "/admin/class_schedules/:id/delete", to: "admin/class_schedules#destroy", as: "delete_admin_class_schedule"
  get "/admin/class_types/:id/delete", to: "admin/class_types#destroy", as: "delete_admin_class_type"
  get "/admin/locations/:id/delete", to: "admin/locations#destroy", as: "delete_admin_location"
  get "/admin/halls/:id/delete", to: "admin/halls#destroy", as: "delete_admin_hall"
  get "/admin/visits/:id/delete", to: "admin/visits#destroy", as: "delete_admin_visit"

end
