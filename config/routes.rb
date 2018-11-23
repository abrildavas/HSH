Rails.application.routes.draw do


  devise_for :administrators,  path: 'administrators', controllers: {sessions: "administrators/sessions",confirmations: "administrators/confirmations",mailer:"administrators/mailer",password: "administrators/password",registration: "administrators/registration",shared:"administrators/shared",unlocks: "administrators/unlocks"}

  devise_for :clients, path: "clients", controllers: {sessions: "clients/sessions",confirmations: "clients/confirmations",mailer: "clients/mailer",password: "clients/password",registration: "clients/registration",shared: "clients/shared",unlocks: "clients/unlocks"}

  resources :administrators
  resources :residences


  root 'administrators#home'

  get 'clients/index'

  get 'clients/show'

  get 'clients/new'

  get 'clients/edit'

  get 'clients/create'

  get 'clients/destroy'


  

  get 'administrators/sesionIniciada/:id', to: 'administrators#sesionIniciada'

  get 'clients/sesionIniciada/:id', to: 'clients#sesionIniciada'
  

  get  'iniciarSesion',to:'administrators#iniciarSesion'

  get 'validarLogIn',to:'administrators#validarLogIn'




   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
