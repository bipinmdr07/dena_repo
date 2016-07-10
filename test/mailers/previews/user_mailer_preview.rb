# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def new_question
    UserMailer.new_question(Forum.first, Comment.first)
  end

  def new_submission
    UserMailer.new_submission(Submission.first, SubmissionComment.first)
  end

  def new_reply
    UserMailer.new_reply(Forum.first, Reply.first, User.first.email)
  end

  def new_submission_reply
    UserMailer.new_submission_reply(Submission.first, SubmissionReply.first, User.first.email)
  end
end
