json.array! @ratings do |rating|
  json.score rating.score  
  json.quiz_category rating.quiz_category
  json.quiz_category_name rating.quiz_category_name
end
