Rails.application.routes.draw do

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
