module CommentsHelper
	def back_to_lesson
		 if Forum.find(@comment.forum_id).name.downcase == "htmlcss"
		 	'/html_css/' + @comment.lesson.to_s
		 else
		 	'/' + Forum.find(@comment.forum_id).name.downcase + '/' + @comment.lesson.to_s
		 end
	end

	def comment_owner(comment)
		User.find(comment.user_id).name
	end

	def reply_owner(reply)
		User.find(reply.user_id).name
	end
end
