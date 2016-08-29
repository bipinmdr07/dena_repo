namespace :users do
  task :update_progressions => :environment do

    Progression.where(course_name: 'HtmlCssLesson', lesson_id: 4).each do |progression|
      puts "Updating progressions..."
      progression.update(lesson_id: 15)
    end

    Progression.where(course_name: 'HtmlCssLesson', lesson_id: 3).each do |progression|
      puts "Updating progressions..."
      progression.update(lesson_id: 4)
    end

    Progression.where(course_name: 'HtmlCssLesson', lesson_id: 4).each do |progression|
      user = progression.user
      puts "Updating progressions..."
      Progression.create([
        { user: user, course_name: 'HtmlCssLesson', lesson_id: 3 },
        { user: user, course_name: 'HtmlCssLesson', lesson_id: 5 },
        { user: user, course_name: 'HtmlCssLesson', lesson_id: 6 },
        { user: user, course_name: 'HtmlCssLesson', lesson_id: 7 },
        { user: user, course_name: 'HtmlCssLesson', lesson_id: 8 },
        { user: user, course_name: 'HtmlCssLesson', lesson_id: 9 },
        { user: user, course_name: 'HtmlCssLesson', lesson_id: 10 },
        { user: user, course_name: 'HtmlCssLesson', lesson_id: 11 },
        { user: user, course_name: 'HtmlCssLesson', lesson_id: 12 },
        { user: user, course_name: 'HtmlCssLesson', lesson_id: 13 },
        { user: user, course_name: 'HtmlCssLesson', lesson_id: 14 },
      ])
    end

    Submission.where(course_name: 'HtmlCssLesson', lesson_id: 4).each do |submission|
      puts "Updating submissions..."
      submission.update(lesson_id: 15)
    end

  end
end