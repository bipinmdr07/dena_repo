class SubmissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_permissions, only: [:edit, :update, :destroy]
  before_action :check_duplicate, only: :create

  def index
    @submissions = current_user.submissions.all.order("created_at DESC")
  end

  def show
    @submission = Submission.includes(:user, submission_replies: :user).find(params[:id])

    create_replies_array

    @user = @submission.user
  end

  def new
    @submission = Submission.new
  end

  def create
    @submission = current_user.submissions.create(submission_params)

    if @submission.valid?           
      respond_to do |format|
        format.json { render json: { redirect: submission_url(@submission.id) } }
        format.html { redirect_to submission_path(@submission.id) }
      end
    else
      flash[:alert] = "Invalid, please try again."
      respond_to do |format|
        format.json { render json: @submission.errors, status: :unprocessable_entity }
        format.html { redirect_to new_submission_path( course_name: submission_params[:course_name], 
                                                       lesson_id: submission_params[:lesson_id]) }
      end
    end
  end  

  def edit
  end

  def update
    if @submission.update(submission_params)      
      respond_to do |format|        
        format.json { render json: MarkdownParser.new(@submission.content).parsed.to_json }
        format.html do
          flash[:success] = "Updated!"
          redirect_to submission_path(@submission.id)
        end
      end      
    else
      respond_to do |format|        
        format.json { render json: @submission.errors, status: :unprocessable_entity }
        format.html do
          flash[:alert] = "Woops! It looks like there has been an error. Please try again."
          render :edit
        end
      end       
    end
  end

  def destroy  
    @submission.destroy
    back_to_lesson_url = PreviousLessonUrlBuilder.new(@submission).url      

    respond_to do |format|
      format.json do 
        render json: { redirect: back_to_lesson_url }        
      end
      format.html do         
        redirect_to back_to_lesson_url   
      end
    end
  end

  private

  def create_replies_array
    @replies = []
    @submission.submission_replies.order("created_at ASC").each do |reply|
      @replies << {reply: reply, 
                   user_is_mentor: reply.user_mentor, 
                   user_avatar_url: reply.user_avatar.url, 
                   user_name: reply.user_name,
                   display_post_links: current_user == reply.user || current_user.admin,
                   content: MarkdownParser.new(reply.content).parsed}
    end
  end

  def check_duplicate
    return unless current_user.submissions.find_by(lesson_id: submission_params[:lesson_id],
                                        course_name: submission_params[:course_name])
    flash[:alert] = "You have already made a submission for this lesson. Please re-submit on your existing submission page."
  end

  def check_permissions
    @submission = Submission.find(params[:id])
    return if current_user.admin || (@submission.user_id == current_user.id)
    flash[:alert] = "Unauthorized!"
    redirect_to submission_path(@submission) 
  end

  def submission_params
    params.require(:submission).permit(:title, :content, :lesson_id, :course_name, :user_id)
  end
end
