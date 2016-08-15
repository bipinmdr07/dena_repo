namespace :users do
  task :update_bootstrap => :environment do
    Progression.where(course_name: "HtmlCssLesson").each do |progression|
      if progression.lesson_id >= 5 && progression.lesson_id < 14
        lesson_id = progression.lesson_id - 4      
        progression.update(course_name: "BootstrapLesson", lesson_id: lesson_id)        
        progression.user.update(bootstrap_access: true) unless progression.user.admitted
      end
      if progression.lesson_id == 14
        progression.update(lesson_id: 5)
      end
    end

    Submission.where(course_name: "HtmlCssLesson", lesson_id: 13)
              .update_all(course_name: "BootstrapLesson", lesson_id: 9)

    Question.where(course_name: "HtmlCssLesson").each do |question|
      if question.lesson_id >= 5 && question.lesson_id < 14
        lesson_id = question.lesson_id - 4      
        question.update(course_name: "BootstrapLesson", lesson_id: lesson_id)        
      end
      if question.lesson_id == 14
        question.update(lesson_id: 5)
      end
    end

    Question.where(course_name: "IntroLesson").each do |question|
      if question.lesson_id > 1 && question.lesson_id < 5
        question.destroy
      elsif question.lesson_id >= 5
        lesson_id = question.lesson_id - 3
        question.update(lesson_id: lesson_id)
      end
    end  

    PublicActivity::Activity.all.each do |progression|
      if progression.parameters[:course_name] == 'HtmlCssLesson'
        if progression.parameters[:lesson_id].to_i >= 5 && progression.parameters[:lesson_id].to_i < 14
          lesson_id = (progression.parameters[:lesson_id].to_i - 4).to_s
          progression.parameters[:course_name] = "BootstrapLesson"
          progression.parameters[:lesson_id] = lesson_id
          progression.save
        end
      end
    end  

    User.where(admitted: true).update_all(bootstrap_access: true)
  end

  task :update_name => :environment do 
    User.all.each do |user|
      next if user.first_name && user.last_name
      first_name = user.name.split(" ")[0]
      if user.name.split(" ").length > 1
        last_name = user.name.split(" ").last
      else
        last_name = "Last Name"
      end
      user.update(first_name: first_name, last_name: last_name)
    end
  end

  task :update_prework_status => :environment do
    User.where.not(start_date: nil).each do |user|
      user.admitted = true
      user.save
    end
    User.where(start_date: nil).each do |user|
      user.prework_start_time = Date.today - 1.weeks
      user.prework_end_date = Date.today + 1.weeks
      user.save
    end
    User.where(admin: true).each do |user|
      user.prework_start_time = nil
      user.prework_end_date = nil
      user.save
    end
  end
end