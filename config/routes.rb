Rails.application.routes.draw do



  get 'pago/new'

  get 'sessions/new'

  root :to => "pages#home"

  get '/home',      to: 'pages#home'
  get  '/about',    to: 'pages#about'
  get  '/contact',  to: 'pages#contact'
  get  '/reportes', to: 'pages#reportes'
  get  '/pagos/reporte', to: 'pagos#reporte'
  get  '/profesionales/reporte', to: 'profesionales#reporte'
#  get  '/pagos/new_mercado_pago', to: 'pagos#new_mercado_pago'

  get  '/signup',   to: 'users#new'
  post '/signup',   to: 'users#create'
  get  '/edit',     to: 'users#edit'
  post '/edit',     to: 'users#update'


  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get    '/general',   to: 'pagos#general'


  get  'search/index', to: 'search#index'



  resources :domicilios
  resources :matriculas
  resources :users
  resources :profesionales do
    get 'show_domicilios'
    get 'pagos/new_mercado_pago', to: 'pagos#new_mercado_pago'
    resources :pagos
    resources :users
  end


  #report kit
  mount ReportsKit::Engine, at: '/'


end
