# frozen_string_literal: true

class Clients::RegistrationsController < Devise::RegistrationsController
  # include Accessible
  #skip_before_action :check_client, except: [:new, :create] 
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
   def new

     super
   end

  #POST /resource
   def create
     #Validacion de Edad >= 18 años antes de registrarse
    fn=Date.parse(params[:client][:fechaNac])
    if ((fn.month>= Date.today.month) and (fn.day>= Date.today.day) )then
      age=Date.today.year-fn.year
    else
      age=Date.today.year-fn.year-1
    end
    if age<18 then

      flash[:notice]="Debes ser mayor de 18 años para registrarte"
       redirect_back(fallback_location: new_client_registration_path)
    else
      if (Date.parse(params[:client][:fechaVencTarj]).past?)
        flash[:notice]="La tarjeta #{params[:client][:marcaTarj]} está vencida"
         redirect_back(fallback_location: new_client_registration_path)
     else
      super 
         self.resource.fechaReg=Date.today
         self.resource.estado="basico"
         self.resource.creditos="2"
         self.resource.save
    
     end
   end

   end
 

  # GET /resource/edit
  def edit
    c=params[:format]
    @client=Client.find_by(id: c)
    if (@client==nil)
     flash[:danger]="Usted no puede acceder a esta seccion"
     redirect_to root_path
   else
     if (@client.id == current_client.id)
      super
    else
     flash[:danger]="Usted no puede acceder a esta seccion"
     redirect_to root_path
   end
 end
end

  # PUT /resource
   def update
      #Validacion de Edad >= 18 años antes de registrarse
    fn=Date.parse(params[:client][:fechaNac])
    if ((fn.month>= Date.today.month) and (fn.day>= Date.today.day) )then
      age=Date.today.year-fn.year
    else
      age=Date.today.year-fn.year-1
    end
    if age<18 then

      flash[:notice]="Debes ser mayor de 18 años para registrarte"
       redirect_back(fallback_location: edit_client_registration_path)
    else
      if (Date.parse(params[:client][:fechaVencTarj]).past?)
        flash[:notice]="La tarjeta #{params[:client][:marcaTarj]} está vencida"
         redirect_back(fallback_location: edit_client_registration_path)
     else
      super 
         self.resource.save
     end
   end
   end

  # DELETE /resource
  # def destroy
  #   super
  # end
   private

  def sign_up_params
    params.require(:client).permit(:nombre ,:apellido, :dni, :fechaNac, :marcaTarj, :numTarj, :fechaVencTarj, :email, :password, :password_confirmation)
    
  end

  def account_update_params
     params.require(:client).permit(:nombre ,:apellido, :dni, :fechaNac, :marcaTarj, :numTarj, :fechaVencTarj, :email, :password, :password_confirmation, :current_password)
   
  end





  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
