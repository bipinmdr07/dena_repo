class QuizCompletionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @quiz_completion = current_user.quiz_completions.new(quiz_completion_params)

    if @quiz_completion.save
      respond_to do |format|
        format.json { render json: @quiz_completion }
      end
    else
      respond_to do |format|
        format.json { render json: :unprocessable_entity }
      end
    end
  end

  private

  def quiz_completion_params
    params.require(:quiz_completion).permit(:lesson_id, :course_name)
  end
end
