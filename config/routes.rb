Rails.application.routes.draw do


  get 'auctioneers_lists/show'

  resources :residences
  resources :reservations
  resources :bids
  resources :hot_sales


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
  
  get 'weeks/:id/estado', to: 'weeks#ModificarCalendario', as: 'week_Modif_Calendar'

  get  'iniciarSesion',to:'administrators#iniciarSesion'

  get 'validarLogIn',to:'administrators#validarLogIn'



  get 'hacerPremium/:id', to:'clients#hacerPremium', as: 'hacerPremium'
  get 'hacerBasico/:id', to:'clients#hacerBasico', as: 'hacerBasico'




  get '/dates/:id', to: 'weeks#dates', as:'week_dates' 

  get '/dates/:id/week', to:'weeks#show',as:'week'

  get 'estado/', to: 'weeks#modificarEstado', as:'week_estado'



get '/auctions', to: 'auctions#index', as: "auctions"
post '/auctions', to: 'auctions#create'
get '/auctions/new/:id', to: 'auctions#new', as: "new_auction"
get '/auctions/:id/edit', to: 'auctions#edit', as: "edit_auction"
get '/auctions/:id', to: 'auctions#show', as: "auction"
patch '/auctions/:id', to: 'auctions#update'
put '/auctions/:id', to: 'auctions#update'
delete '/auctions/:id', to: 'auctions#destroy'

get '/reservarPremium', to:'weeks#reservarPremium', as: "reservar_premium"

  

   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
