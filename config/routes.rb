Rails.application.routes.draw do
  get 'password_resets/new'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get 'cities/:state', to: 'application#cities'
   root 'welcome#index';
    
    get 'signup', to: 'users#new'
    
    
    
    get 'login', to: 'sessions#new'

post 'login', to: 'sessions#create'

get 'logout', to: 'sessions#destroy'
    
resources :sessions
resources :password_resets    
        
end
