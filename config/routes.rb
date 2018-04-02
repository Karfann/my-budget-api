Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :transactions
  resources :accounts do
    get 'active', on: :collection
  end
  resources :status do
    get 'active', on: :collection
  end
  resources :categories do 
    get 'active', on: :collection
  end
  resources :types do 
    get 'active', on: :collection
  end
end