json.array! @quiz_problems do |quiz_problem|
  json.id quiz_problem.id
  json.question quiz_problem.question
  json.quiz_options quiz_problem.quiz_options, :id, :content, :correct
end