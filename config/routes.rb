Rails.application.routes.draw do
    match 'api/v1/auth', to: 'api/v1/users#login_token', via: :post 
    namespace :api do
      namespace :v1 do
        resources :entries
        match 'users/apps', to: 'users#getapps', via: :get
        match 'users/settings', to: 'users#getsettings', via: :get
        resources :users
      end
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
