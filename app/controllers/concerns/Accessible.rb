module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_client
  end

  protected
  def check_client
    if current_administrator
      flash.clear
      # if you have rails_admin. You can redirect anywhere really
      redirect_to(rails_administrator.dashboard_path) && return
    elsif current_client
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      redirect_to(authenticated_client_root_path) && return
    end
  end
end