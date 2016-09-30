namespace :users do
  task :convert_to_immersive => :environment do
    User.update_all(package: :immersive)
  end

  task :update_ideator => :environment do
    Progression.where(course_name: 'IdeatorLesson').update_all(course_name: 'TwitrLesson')
    Question.where(course_name: 'IdeatorLesson').update_all(course_name: 'TwitrLesson')
    Submission.where(course_name: 'IdeatorLesson').update_all(course_name: 'TwitrLesson')
    PublicActivity::Activity.all.each do |activity|
      if activity.parameters[:course_name] == "IdeatorLesson"
        activity.parameters[:course_name] = "TwitrLesson"
        activity.save!
      end
    end

  end
end