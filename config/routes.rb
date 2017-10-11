Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get 'cities/:state', to: 'application#cities'
   root 'welcome#index';
end
