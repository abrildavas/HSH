Rails.application.routes.draw do


  resources :administrators
  resources :residences
  resources :clients
  resources :auctions
  resources :bids



  root 'administrators#home'



  get 'administrators/sesionIniciada/:id', to: 'administrators#sesionIniciada'

  get 'clients/sesionIniciada/:id', to: 'clients#sesionIniciada'
  

  get  'iniciarSesion',to:'administrators#iniciarSesion'

  get 'validarLogIn',to:'administrators#validarLogIn'

  get 'hacerPremium/:id', to:'clients#hacerPremium', as: 'hacerPremium'
  get 'hacerBasico/:id', to:'clients#hacerBasico', as: 'hacerBasico'

  


   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
