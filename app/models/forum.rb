class Forum < ActiveRecord::Base
	has_many :comments

	# FORUMS = []

	# Intro::LESSONS.each do |chapter|
	# 	chapter[1].each do |lesson|
	# 		FORUMS << [chapter[0], lesson[1]]
	# 	end
	# end

	# class << self
	# 	FORUMS.each do |forum|
	# 		define_method forum[1].downcase.gsub(" ", "_").gsub("-", "_") do
	# 			Forum.find_by(lesson: forum[1].upcase)
	# 		end
	# 	end
	# end
end
