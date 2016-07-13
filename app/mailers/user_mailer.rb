class UserMailer < ApplicationMailer
	default from: "TECHRISE <takehiro@techrise.me>"

	def new_question(question)
		@question = question
		mail(to: "techrisecoding@gmail.com", subject: 'New Question')
	end

	def new_submission(submission)
		@submission = submission
		mail(to: "techrisecoding@gmail.com", subject: 'New Submission')
	end

	def new_reply(question, email)
		@question = question
		mail(from: "TECHRISE <takehiro@techrise.me>", to: email, subject: 'New Reply')
	end

	def new_submission_reply(submission, email)
		@submission = submission
		mail(from: "TECHRISE <takehiro@techrise.me>", to: email, subject: 'New Reply')
	end


end
