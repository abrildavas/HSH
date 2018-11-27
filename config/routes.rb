Rails.application.routes.draw do


  resources :administrators
  resources :residences
  resources :clients
  resources :auctions
  resources :bids



  root 'administrators#home'

  get 'residences/:id/cambio', to: 'residences#cambio', as: 'residence_change'

  get 'residences/:id/dates', to: 'residences#dates', as:'residence_dates' 

  get 'administrators/sesionIniciada/:id', to: 'administrators#sesionIniciada'

  get 'clients/sesionIniciada/:id', to: 'clients#sesionIniciada'
  
  get 'residences/:id/estado', to: 'residences#editarEstado', as: 'residence_estado'

  get  'iniciarSesion',to:'administrators#iniciarSesion'

  get 'validarLogIn',to:'administrators#validarLogIn'

  get 'hacerPremium/:id', to:'clients#hacerPremium', as: 'hacerPremium'
  get 'hacerBasico/:id', to:'clients#hacerBasico', as: 'hacerBasico'

  


   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
