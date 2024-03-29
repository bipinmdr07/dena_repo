class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_permissions, only: [:edit, :update, :destroy]

  def index
    @questions = current_user.questions.all
  end

  def show
    @question = Question.includes(:user).find(params[:id])  
    
    create_replies_array
    
    @user = @question.user
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      respond_to do |format|
        format.json { render json: { redirect: question_url(@question.id) } }
        format.html { redirect_to question_path(@question.id) }
      end    
    else
      flash[:alert] = "Invalid attributes, please try again."

      respond_to do |format|
        format.json { render json: @question.errors, status: :unprocessable_entity }
        format.html { redirect_to new_question_path(lesson_id: question_params[:lesson_id], 
                                                    course_name: question_params[:course_name]) }
      end      
    end
  end  

  def edit

  end

  def update
    if @question.update(question_params)    
      respond_to do |format|        
        format.json { render json: MarkdownParser.new(@question.content).parsed.to_json }
        format.html do
          flash[:success] = "Updated!"
          redirect_to question_path(@question.id)
        end
      end      
    else
      respond_to do |format|        
        format.json { render json: @question.errors, status: :unprocessable_entity }
        format.html do
          flash[:alert] = "Woops! It looks like there has been an error. Please try again."
          render :edit
        end
      end       
    end
  end

  def destroy  
    back_to_lesson_url = PreviousLessonUrlBuilder.new(@question).url      
    @question.destroy

    respond_to do |format|
      format.json do 
        render json: { redirect: back_to_lesson_url }        
      end
      format.html do 
        if @question.mentor_post
          redirect_to community_path
        else          
          redirect_to back_to_lesson_url 
        end    
      end
    end
  end

  private

  def create_replies_array
    @replies = []
    @question.replies.order("created_at ASC").each do |reply|
      @replies << {reply: reply, 
                   user_is_mentor: reply.user_mentor, 
                   user_avatar_url: reply.user_avatar.url, 
                   user_name: reply.user_name,
                   display_post_links: current_user == reply.user || current_user.admin,
                   content: MarkdownParser.new(reply.content).parsed}
    end
  end

  def check_permissions
    @question = Question.friendly.find(params[:id])
    return if current_user.admin || (@question.user == current_user)
    flash[:alert] = "Unauthorized!"
    redirect_to question_path(@question) 
  end

  def question_params
    params.require(:question).permit(:title, :content, :lesson_id, :course_name, :user_id, :mentor_post)
  end
end
