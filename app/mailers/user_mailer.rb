class UserMailer < ApplicationMailer
	default from: "TECHRISE <takehiro@techrise.me>"

	def new_question(forum, post)
		@forum = forum
		@post = post
		mail(to: "techrisecoding@gmail.com", subject: 'New Question')
	end

	def new_submission(forum, post)
		@forum = forum
		@post = post
		mail(to: "techrisecoding@gmail.com", subject: 'New Submission')
	end

	def new_reply(forum, post, email)
		@forum = forum
		@post = post
		mail(from: "TECHRISE <takehiro@techrise.me>", to: email, subject: 'New Reply')
	end

	def new_submission_reply(forum, post, email)
		@forum = forum
		@post = post
		mail(from: "TECHRISE <takehiro@techrise.me>", to: email, subject: 'New Reply')
	end


end
