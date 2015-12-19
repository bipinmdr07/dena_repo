module CommentsHelper
	def back_to_lesson
		'/' + Forum.find(@comment.forum_id).name.downcase + '/' + @comment.lesson.to_s
	end
end
