class RegistrationsController < Devise::RegistrationsController
  def create
    
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        binding.pry
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length      
      if resource.remote?
        redirect_to apply_remote_path && return
      elsif resource.immersive?
        redirect_to apply_immersive_path && return
      end
    end
  end

  protected

  def after_inactive_sign_up_path_for(resource)  
    if resource.remote?      
      apply_remote_next_steps_path
    else
      apply_immersive_next_steps_path
    end
  end

end

  