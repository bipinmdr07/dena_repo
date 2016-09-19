class Users::OmniauthCallbacksController < ApplicationController
  def facebook    
    process_oauth(request.env["omniauth.params"])
  end

  def github
    process_oauth(request.env["omniauth.params"])
  end

  private

  def process_oauth(omniauth_params)    
    binding.pry
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Signed in!"
      sign_in_and_redirect user
    else      
      session["devise.user_attributes"] = user.attributes            
      if omniauth_params["remote"] == "true"      
        redirect_to apply_remote_url
      elsif omniauth_params["immersive"] == "true"
        redirect_to apply_immersive_url
      end
    end

  end
end
