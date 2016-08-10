class ImagesController < ApplicationController
  protect_from_forgery except: :create

  def create
    @image = Image.new(image_params)
    @image.save

    respond_to do |format|
      format.json { render :json => { url: @image.photo.url, image_id: @image.id } }
    end
  end



  private
  def image_params
    params.require(:image).permit(:photo)
  end
end
