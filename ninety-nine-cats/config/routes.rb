Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  patch '/cat_rental_requests/approve/:id', to: 'cat_rental_requests#approve', as: 'rental_approve'
  patch '/cat_rental_requests/deny/:id', to: 'cat_rental_requests#deny', as: 'rental_deny'
  resources :cats, only: [:index, :show, :new, :create, :edit, :update]
  resources :cat_rental_requests, only: [:new, :create]
end
