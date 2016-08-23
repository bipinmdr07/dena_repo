class UserMailer < ApplicationMailer
	default from: "TECHRISE <contact@techrise.me>"

	def prework_reminder(email, days_left)
		@days_left = days_left

		if days_left > 1
			mail(from: "TECHRISE <contact@techrise.me>", to: email, subject: "#{days_left} until pre-work period ends!")
		else
			mail(from: "TECHRISE <contact@techrise.me>", to: email, subject: "Your pre-work period has ended.")
		end
	end

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
		mail(from: "TECHRISE <contact@techrise.me>", to: email, subject: 'New Reply')
	end

	def new_submission_reply(submission, email)
		@submission = submission
		mail(from: "TECHRISE <contact@techrise.me>", to: email, subject: 'New Reply')
	end


end
