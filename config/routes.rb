Rails.application.routes.draw do


  get 'auctioneers_lists/index'

  get 'auctioneers_lists/show'

  resources :residences
  resources :reservations
  resources :bids

  resources :auctioneers_lists


devise_for :administrators,  path: 'administrators', controllers: {sessions: "administrators/sessions",confirmations: "administrators/confirmations",mailer:"administrators/mailer",password: "administrators/password",registration: "administrators/registration",shared:"administrators/shared",unlocks: "administrators/unlocks"}
devise_for :clients, path: "clients", controllers: {sessions: "clients/sessions",confirmations: "clients/confirmations",mailer: "clients/mailer",password: "clients/password",registrations: "clients/registrations",shared: "clients/shared",unlocks: "clients/unlocks"}

root 'administrators#home'



get 'showLista/:id', to:'auctioneers_lists#show',as: "show_lista" 

get '/clients', to: 'clients#index', as: "clients"
post '/clients', to: 'clients#create'
get '/clients/new', to: 'clients#new', as: "new_client"
get '/clients/:id/edit', to: 'clients#edit', as: "edit_client"
get '/clients/:id', to: 'clients#show', as: "client"
patch '/clients/:id', to: 'clients#update'
put '/clients/:id', to: 'clients#update'
delete '/clients/:id', to: 'clients#destroy'
get '/clientsearch', to: 'clients#search', as: "search_client"



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

  get 'ayuda', to: 'clients#ayuda'
  get 'Contacto', to: 'clients#contacto'

  get 'hacerPremium/:id', to:'clients#hacerPremium', as: 'hacerPremium'
  get 'hacerBasico/:id', to:'clients#hacerBasico', as: 'hacerBasico'


get '/buscador',to: 'residences#buscador', as: 'residence_buscador'
  get '/searchAdmin', to: 'residences#searchAdmin', as: 'residence_search_admin'
  get '/searchClient', to: 'residences#searchClient', as: 'residence_search_client'
  



  get '/dates/:id', to: 'weeks#dates', as:'week_dates' 

  get '/dates/:id/week', to:'weeks#show',as:'week'

  get 'estado/', to: 'weeks#modificarEstado', as:'week_estado'


get '/crearbid', to: 'bids#create'
get '/auctions', to: 'auctions#index', as: "auctions"
post '/auctions', to: 'auctions#create'
get '/auctions/new/:id', to: 'auctions#new', as: "new_auction"
get '/auctions/:id/edit', to: 'auctions#edit', as: "edit_auction"
get '/auctions/:id', to: 'auctions#show', as: "auction"
patch '/auctions/:id', to: 'auctions#update'
put '/auctions/:id', to: 'auctions#update'
delete '/auctions/:id', to: 'auctions#destroy'
get '/finishAuction/:id',to: 'auctions#finishAuction', as: "finish_auction" 


get '/hot_sales', to: 'hot_sales#index', as: "hot_sales"
post '/hot_sales', to: 'hot_sales#create'
get '/hot_sales/new/:id', to: 'hot_sales#new', as: "new_hot_sale"
get '/hot_sales/:id/edit', to: 'hot_sales#edit', as: "edit_hot_sale"
get '/hot_sales/:id', to: 'hot_sales#show', as: "hot_sale"
patch '/hot_sales/:id', to: 'hot_sales#update'
put '/hot_sales/:id', to: 'hot_sales#update'
delete '/hot_sales/:id', to: 'hot_sales#destroy'
get '/eliminar/:id', to: 'hot_sales#elminiar', as:"eliminar_hotsale"
get '/reservarHotsale/:id', to: 'hot_sales#reservarHotsale',as: "reservar_hotsale"

get '/reservarPremium', to:'weeks#reservarPremium', as: "reservar_premium"

get '/ingresarClienteToAuction',to: 'auctioneers_lists#create',as: "ingresar_cliente_to_auction"
  

   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
