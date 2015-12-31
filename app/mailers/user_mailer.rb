class UserMailer < ApplicationMailer
	default from: "takehiromouri@gmail.com"

	def new_question(forum, post)
		@forum = forum
		@post = post
		mail(to: "techrisecoding@gmail.com", subject: 'New Question')
	end
end
