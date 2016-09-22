class ApplyController < ApplicationController
  layout :apply_layout
  respond_to :html, :json

  def index
  end

  def remote    
    build_resource
  end

  def immersive       
    build_resource
  end

  def remote_next_steps

  end


  def immersive_next_steps

  end

  private  

  def build_resource(hash=nil)
    @resource = User.new_with_session({}, session)
  end

  def apply_layout
    "apply"
  end
end
