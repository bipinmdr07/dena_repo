module CommentsHelper

	def comment_owner(comment)
		User.find(comment.user_id).name
	end

	def reply_owner(reply)
		User.find(reply.user_id).name
	end
end
