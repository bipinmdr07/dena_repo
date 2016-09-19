class ImmersiveApplicantsController < ApplicationController


  def create
    # user = User.create(user_params)

    # if user.valid?
    #   # send email
    #   redirect_to apply_immersive_next_steps_path
    # else
    #   redirect_to apply_immersive_path      
    # end
  end

  protected

  def after_sign_up_path_for(resource)
    apply_immersive_next_steps_path
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, 
                                 :first_name, :last_name, :facebook_handle, :twitter_handle, 
                                 :github_handle, :personal_website, :mobile_number, :uid, 
                                 :provider, :application_reasons, :package).merge(package: :immersive)
  end
end
