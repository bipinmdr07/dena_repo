class ImmersiveApplicantsController < ApplicationController
  def create
    user = User.create(user_params)

    if user.valid?
      # send email
      redirect_to root_path      
    else
      redirect_to apply_immersive_path      
    end
    
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, 
                                 :first_name, :last_name, :facebook_handle, :twitter_handle, 
                                 :github_handle, :personal_website, :mobile_number, :uid, 
                                 :provider, :application_reasons, :package).merge(package: :immersive)
  end
end
