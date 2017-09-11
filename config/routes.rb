Rails.application.routes.draw do

  get 'users/new'

  get "/home", to: "pages#home"

  get "pages/contact"

  get "pages/about"

  root :to => "pages#home"

  get "search/index", to: "search#index"

  resources :domicilios

  resources :matriculas

  resources :profesionales do
    get 'show_domicilios'
  end

end
