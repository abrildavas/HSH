Rails.application.routes.draw do

  get 'hot_sales/show'

  get 'hot_sales/index'

  resources :residences
  resources :weeks

  resources :reservations
  resources :auctions
  resources :bids


devise_for :administrators,  path: 'administrators', controllers: {sessions: "administrators/sessions",confirmations: "administrators/confirmations",mailer:"administrators/mailer",password: "administrators/password",registration: "administrators/registration",shared:"administrators/shared",unlocks: "administrators/unlocks"}

devise_for :clients, path: "clients", controllers: {sessions: "clients/sessions",confirmations: "clients/confirmations",mailer: "clients/mailer",password: "clients/password",registrations: "clients/registrations",shared: "clients/shared",unlocks: "clients/unlocks"}



root 'administrators#home'


get '/clients', to: 'clients#index', as: "clients"
post '/clients', to: 'clients#create'
get '/clients/new', to: 'clients#new', as: "new_client"
get '/clients/:id/edit', to: 'clients#edit', as: "edit_client"
get '/client/:id', to: 'clients#show', as: "client"
patch '/clients/:id', to: 'clients#update'
put '/clients/:id', to: 'clients#update'
delete '/clients/:id', to: 'clients#destroy'



get '/administrators', to: 'administrators#index', as: "administrators"
post '/administrators', to: 'administrators#create'
get '/administrators/new', to: 'administrators#new', as: "new_administrator"
get '/administrators/:id/edit', to: 'administrators#edit', as: "edit_administrator"
get '/administrator/:id', to: 'administrators#show', as: "administrator"
patch '/administrators/:id', to: 'administrators#update'
put '/administrators/:id', to: 'administrators#update'
delete '/administrators/:id', to: 'administrators#destroy'





 get 'administrators/sesionIniciada/:id', to: 'administrators#sesionIniciada'

  get 'clients/sesionIniciada/:id', to: 'clients#sesionIniciada'
  
  get 'residences/:id/estado', to: 'residences#editarEstado', as: 'residence_estado'

  get  'iniciarSesion',to:'administrators#iniciarSesion'

  get 'validarLogIn',to:'administrators#validarLogIn'



  get 'hacerPremium/:id', to:'clients#hacerPremium', as: 'hacerPremium'
  get 'hacerBasico/:id', to:'clients#hacerBasico', as: 'hacerBasico'



  get 'residences/:id/cambio', to: 'residences#cambio', as: 'residence_change'

  get 'residences/:id/dates', to: 'residences#dates', as:'residence_dates' 

  

   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
