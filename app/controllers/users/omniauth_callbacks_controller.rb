class Users::OmniauthCallbacksController < ApplicationController
  def facebook    
    process_oauth(request.env["omniauth.params"])
  end

  def github
    process_oauth(request.env["omniauth.params"])
  end

  private

  def process_oauth(omniauth_params)    
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Signed in!"
      sign_in_and_redirect user
    elsif omniauth_params.empty?
      flash.alert = "Could not log in user."
      redirect_to new_user_session_path
    else      
      session["devise.user_attributes"] = user.attributes            
      if omniauth_params["remote"] == "true"      
        redirect_to apply_remote_url
      elsif omniauth_params["immersive"] == "true"
        redirect_to apply_immersive_url
      elsif omniauth_params["school"] == "true"
        redirect_to apply_school_url
      end
    end

  end
end
