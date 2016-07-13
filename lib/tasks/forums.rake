task :update_forums => :environment do
  SubmissionComment.all.each do |comment|
    course_name = Submission.find(comment.submission_id).name
    submission = Submission.create(title: comment.title,
      content: comment.description,
      lesson_id: comment.lesson,
      user_id: comment.user_id,
      course_name: course_name.chomp("s"),
      approved: comment.approved)
    SubmissionReply.where(submission_id: comment.id).each do |reply|
      reply.update(submission_id: submission.id)
    end
  end

  Comment.all.each do |comment|
    course_name = Forum.find(comment.forum_id).name
    question = Question.create(title: comment.title,
      content: comment.description,
      lesson_id: comment.lesson,
      user_id: comment.user_id,
      course_name: course_name.chomp("s"),
      resolved: comment.resolved)
    Reply.where(question_id: comment.id).each do |reply|
      reply.update(question_id: question.id)
    end
  end

  Submission.where.not(name: nil).destroy_all
  # Forum.destroy_all
end