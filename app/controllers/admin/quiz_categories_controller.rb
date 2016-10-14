class Admin::QuizCategoriesController < ApplicationController
  def index
    respond_to do |format|
      format.json { render json: QuizCategory.all.pluck(:name) }
    end
  end

  def create
    @quiz_category = QuizCategory.new(quiz_category_params)

    if @quiz_category.save
      respond_to do |format|
        format.json { render json: @quiz_category }
      end
    else 
      respond_to do |format|
        format.json { render json: { errors: @quiz_category.errors.full_messages }, status: :unprocesseable_entity }
      end
    end
  end

  private

  def quiz_category_params
    params.require(:quiz_category).permit(:name)
  end
end
