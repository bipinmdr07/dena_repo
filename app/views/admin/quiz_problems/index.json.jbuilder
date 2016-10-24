json.array! @quiz_problems do |course_name, quiz_problems|
  json.course_name course_name
  json.quiz_problems do
    json.array! quiz_problems do |quiz_problem|
      json.id quiz_problem.id
      json.lesson_id quiz_problem.lesson_id
      json.question quiz_problem.question
      json.quiz_options quiz_problem.quiz_options, :id, :content, :correct
    end
  end
end