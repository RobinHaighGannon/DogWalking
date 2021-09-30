Rails.application.routes.draw do
  get 'newbookings/index'
  get 'customers/index'
  get 'pets/index'
  get 'homepage/index'
  get 'welcome/index'
  root 'welcome#index'

  resources :customers do
    resources :pets 
    resources :newbookings
  end
 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
