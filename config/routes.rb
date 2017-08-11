Odontologos::Application.routes.draw do
  get "/home", to: "pages#home"

  get "pages/contact"

  get "pages/about"

  root :to => "pages#home"


  resources :domicilios


  resources :matriculas


  resources :profesionales do
    get 'show_domicilios'
  end

end
