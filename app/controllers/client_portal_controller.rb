class ClientPortalController < ApplicationController
  
  before_filter :authenticate_user!
  
  layout "client_portal"

  def settings
    @user = current_user
    
  
  end
 
  def edit_password
    @user = current_user
    
    
  end
  def update_password
      @user = User.find(current_user.id)
      if @user.update_with_password(params[:user])
        # Sign in the user by passing validation in case his password changed
        sign_in @user, :bypass => true
        redirect_to client_portal_path
      else
        render "edit_password"
      end
    end
    
   
    
end
