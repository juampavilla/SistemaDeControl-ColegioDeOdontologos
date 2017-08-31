Odontologos::Application.routes.draw do
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
