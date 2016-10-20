json.array! @quiz_problems do |quiz_problem|
  json.id quiz_problem.id
  json.course_name quiz_problem.course_name
  json.lesson_id quiz_problem.lesson_id
  json.question quiz_problem.question
  json.quiz_options quiz_problem.quiz_options.randomize, :id, :content, :correct
end