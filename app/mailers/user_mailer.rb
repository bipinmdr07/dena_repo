class UserMailer < ApplicationMailer
	include ActionView::Helpers::TextHelper

	default from: "TECHRISE <contact@techrise.me>"

	def prework_finished(user)
		@user = user

		mail(from: "TECHRISE <contact@techrise.me>", to: user.email, subject: "Your Pre-work Period at TECHRISE has ended")
	end

	def prework_reminder(user, days)
		@user = user
		@days = days		

		if days >= 1
			mail(from: "TECHRISE <contact@techrise.me>", to: user.email, subject: "#{pluralize(days, 'day')} left until your pre-work period ends!")
		elsif days == 0
			mail(from: "TECHRISE <contact@techrise.me>", to: user.email, subject: "Last day to finish pre-work assignments!")
		else
			mail(from: "TECHRISE <contact@techrise.me>", to: user.email, subject: "Your pre-work period is almost over!")			
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
