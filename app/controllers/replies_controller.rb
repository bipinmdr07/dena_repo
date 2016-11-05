class RepliesController < ApplicationController
	before_action :authenticate_user!
  before_action :check_permissions, only: [:edit, :update, :destroy]

	def create    
	  @reply = current_user.replies.new(reply_params)

		if @reply.save

      respond_to do |format|
        format.json { render json: {reply: @reply, 
                                    user_is_mentor: @reply.user_mentor, 
                                    user_avatar_url: @reply.user_avatar.url, 
                                    user_name: @reply.user_name,
                                    display_post_links: current_user == @reply.user || current_user.admin,
                                    content: MarkdownParser.new(@reply.content).parsed}.to_json }
        format.html { redirect_to question_path(@reply.question) }
      end
		else
			flash[:alert] = "Invalid attributes, please try again."
      
      respond_to do |format|
        format.json { render json: @reply.errors, status: :unprocessable_entity }
        format.html { redirect_to question_path(@reply.question) }
      end
		end
		
	end

	def edit
	end

	def update
    if current_reply.update(reply_params)
      respond_to do |format|        
        format.json { render json: MarkdownParser.new(current_reply.content).parsed.to_json }
        format.html do
          flash[:success] = "Updated!"
          redirect_to question_path(current_reply.question)
        end
      end      
    else
      respond_to do |format|        
        format.json { render json: current_reply.errors, status: :unprocessable_entity }
        format.html do
          flash[:alert] = "Woops! It looks like there has been an error. Please try again."
          render :edit
        end
      end             
    end
  end

  def destroy
    current_reply.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.html { redirect_to question_path(current_reply.question) }
    end
  end

	private

  helper_method :current_reply
  def current_reply
    @current_reply ||= Reply.find(params[:id])
  end

	def check_permissions
    return if current_user.admin || (current_reply.user == current_user)
    flash[:alert] = "Unauthorized!"
    redirect_to question_path(current_reply.question)
  end

	def reply_params
		params.require(:reply).permit(:content, :user_id).merge(question_id: params[:question_id])
	end
end
