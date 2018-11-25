Rails.application.routes.draw do

  get 'weeks/index'

  get 'weeks/show'

  get 'weeks/delete'

  get 'weeks/new'

  get 'weeks/create'

  get 'reservations/index'

  get 'reservations/show'

  get 'reservations/delete'

  get 'reservations/create'

  get 'clients/delete'

  get 'bids/index'

  get 'bids/show'

  get 'bids/delete'

  get 'bids/create'

  get 'bids/new'

  get 'auctions/index'

  get 'auctions/show'

  get 'auctions/create'

  get 'auctions/new'

  get 'auctions/delete'

  resources :administrators
  resources :residences
  resources :clients


  root 'administrators#home'

  get 'residences/:id/dates', to: 'residences#dates', as:'residence_dates' 

  get 'administrators/sesionIniciada/:id', to: 'administrators#sesionIniciada'

  get 'clients/sesionIniciada/:id', to: 'clients#sesionIniciada'
  

  get  'iniciarSesion',to:'administrators#iniciarSesion'

  get 'validarLogIn',to:'administrators#validarLogIn'
  


   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
