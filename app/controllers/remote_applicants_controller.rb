class RemoteApplicantsController < ApplicationController
  def create
    user = User.create(user_params)

    if user.valid?
      # send email
      redirect_to apply_remote_next_steps_path
    else
      redirect_to apply_remote_path
    end
    
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, 
                                 :first_name, :last_name, :facebook_handle, :twitter_handle, 
                                 :github_handle, :personal_website, :mobile_number, :uid, 
                                 :provider, :application_reasons, :package).merge(package: :remote)
  end
end
