module ForumsHelper
  def back_to_lesson
    if params[:forum_id]
      forum = Forum.find(params[:forum_id]) 
      if params[:id]
        comment = Comment.find(params[:id]) 
        lesson_name = Tags::LESSONS[forum.name.underscore].keys[comment.lesson - 1][1]
        link_to 'Back to ' + lesson_name, "/" + forum.name.underscore + "/" + comment.lesson.to_s
      else
        lesson_name = Tags::LESSONS[forum.name.underscore].keys[params[:lesson].to_i - 1][1]
        link_to 'Back to ' + lesson_name, "/" + forum.name.underscore + "/" + params[:lesson].to_s
      end
    elsif params[:submission_id]
      submission = Submission.find(params[:submission_id])
      if params[:id]
        submission_comment = SubmissionComment.find(params[:id]) 
        lesson_name = Tags::LESSONS[submission.name.underscore].keys[submission_comment.lesson - 1][1]
        link_to 'Back to ' + lesson_name, "/" + submission.name.underscore + "/" + submission_comment.lesson.to_s
      else
        lesson_name = Tags::LESSONS[submission.name.underscore].keys[params[:lesson].to_i - 1][1]
        link_to 'Back to ' + lesson_name, "/" + submission.name.underscore + "/" + params[:lesson].to_s
      end
    end
  end
end
