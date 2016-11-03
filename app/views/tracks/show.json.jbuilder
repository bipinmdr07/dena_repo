json.courses do
  json.array! @track.courses do |course|
    json.course_name course.constantize::COURSE_TITLE
    json.chapters do
      json.array! course.constantize::CHAPTERS do |chapter|
        json.title chapter.title
        json.lessons do
          json.array! course.constantize::LESSONS.select{|lesson| lesson.chapter == chapter} do |lesson|
            json.title lesson.title
          end
        end 
      end
    end
  end
end
