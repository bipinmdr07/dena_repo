module ForumsHelper
  def back_to_lesson
    if params[:forum_id]
      forum = Forum.find(params[:forum_id]) 
      if params[:id]
        comment = Comment.find(params[:id]) 
        link_to '<< Back to lesson', "/" + forum.name.underscore + "/" + comment.lesson.to_s
      else
        link_to '<< Back to lesson', "/" + forum.name.underscore + "/" + params[:lesson].to_s
      end
    elsif params[:submission_id]
      submission = Submission.find(params[:submission_id])
      if params[:id]
        submission_comment = SubmissionComment.find(params[:id]) 
        link_to '<< Back to lesson', "/" + submission.name.underscore + "/" + submission_comment.lesson.to_s
      else
        link_to '<< Back to lesson', "/" + submission.name.underscore + "/" + params[:lesson].to_s
      end
    end
  end
end
