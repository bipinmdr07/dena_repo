# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  def prework_reminder_4_days
    UserMailer.prework_reminder(FactoryGirl.build(:prework_student), 4)
  end

  def prework_reminder_3_days
    UserMailer.prework_reminder(FactoryGirl.build(:prework_student), 3)
  end

  def prework_reminder_2_days
    UserMailer.prework_reminder(FactoryGirl.build(:prework_student), 2)
  end

  def prework_reminder_1_days
    UserMailer.prework_reminder(FactoryGirl.build(:prework_student), 1)
  end

  def prework_reminder_0_days
    UserMailer.prework_reminder(FactoryGirl.build(:prework_student), 0)
  end

  def confirmation
    Devise::Mailer.confirmation_instructions(User.first, "faketoken")
  end

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
