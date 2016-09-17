class Users::OmniauthCallbacksController < ApplicationController
  def all    
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Signed in!"
      sign_in_and_redirect user
    else      
      session["devise.user_attributes"] = user.attributes      
      if params[:remote] == "true"      
        redirect_to apply_remote_url
      elsif params[:immersive] == "true"
        redirect_to apply_immersive_url
      end
    end
  end
  alias_method :github, :all
end
