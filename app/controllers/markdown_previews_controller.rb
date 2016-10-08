class MarkdownPreviewsController < ApplicationController
  def create
    preview = MarkdownParser.new(preview_params[:content]).parsed.to_json
    respond_to do |format|
      format.json { render json: preview }
    end
  end

  private

  def preview_params
    params.require(:preview).permit(:content)
  end

end
