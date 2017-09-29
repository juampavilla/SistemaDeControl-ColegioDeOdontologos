Rails.application.routes.draw do
  get 'sessions/new'

  root :to => "pages#home"

  get '/home', to: 'pages#home'
  get  '/about',   to: 'pages#about'
  get  '/contact', to: 'pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get  'search/index', to: 'search#index'

  resources :domicilios
  resources :matriculas
  resources :profesionales do
    get 'show_domicilios'
  end
  resources :users

end
