class Admin::QuizOptionsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @quiz_option = QuizOption.find(params[:id])

    if @quiz_option.update(quiz_option_params)
      respond_to do |format|
        format.json { render json: @quiz_option.content.to_json }
      end
    else
      respond_to do |format|
        format.json { render json: { errors: @quiz_option.errors }, status: :unprocessable_entity }
      end
    end
  end

  private

  def quiz_option_params
    params.require(:quiz_option).permit(:content)
  end
end
