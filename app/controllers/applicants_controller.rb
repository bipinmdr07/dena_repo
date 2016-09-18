class ApplicantsController < ApplicationController
  def create
    user = User.create(user_params)

    if user.valid? && user.remote?
      # send email
      redirect_to root_path
    elsif user.valid? && user.immersive?
      # send email
      redirect_to root_path      
    else
      return redirect_to apply_remote_path if user.remote?
      return redirect_to apply_immersive_path if user.immersive?
      redirect_to apply_path
    end
    
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, 
                                 :first_name, :last_name, :facebook_handle, :twitter_handle, 
                                 :github_handle, :personal_website, :mobile_number, :uid, 
                                 :provider, :application_reasons, :package)
  end
end
