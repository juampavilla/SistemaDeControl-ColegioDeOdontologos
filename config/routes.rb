Rails.application.routes.draw do
  root :to => "pages#home"

  get '/home', to: 'pages#home'
  get  '/about',   to: 'pages#about'
  get  '/contact', to: 'pages#contact'
  get  '/signup',  to: 'users#new'
  get  'search/index', to: 'search#index'

  resources :domicilios
  resources :matriculas
  resources :profesionales do
    get 'show_domicilios'
  end
  resources :users

end
