class AdministratorsController < ApplicationController

  def home
    render layout: false
    if client_signed_in? then
      @client=current_client
    end

        

    


  end

  def validarLogIn

    if (params[:nombreDeUsuario].present? && params[:clave].present?) 
      admin=Administrator.where(nomUsuario: params[:nombreDeUsuario],password: params[:clave] )
      if admin.blank? then
         flash[:notice]="   Email o Contraseña inválida "
        redirect_to '/iniciarSesion'
       else 
        redirect_to controller: 'administrators', action: 'sesionIniciada', id: 1 #deber ser el id del admin
       end 
     end
    
  end

  def sesionIniciada
    #@admin=Administrator.find(params[:id])


    
  end

   def iniciarSesion
   	
  
  end
 

  def default


  end
end
