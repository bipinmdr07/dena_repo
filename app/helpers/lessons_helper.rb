module LessonsHelper
  def get_lesson_name(course_name, lesson_id)
    Tags::LESSONS[course_name.underscore + "s"].keys[lesson_id.to_i - 1][1]
  end

  def question_back_to_lesson
    if params[:id]
      forum = controller_name.classify.constantize.friendly.find(params[:id])
      course_name = forum.course_name.underscore + "s"
      lesson_name = Tags::LESSONS[course_name].keys[forum.lesson_id - 1][1]
      link_to ('<i class="fa fa-caret-left" aria-hidden="true"></i> ' + lesson_name).html_safe, "/" + course_name + "/" + forum.lesson_id.to_s, class: 'btn btn-back btn-default'
    else
      course_name = params[:course_name].underscore + "s"
      lesson_name = Tags::LESSONS[course_name].keys[params[:lesson_id].to_i - 1][1]
      link_to ('<i class="fa fa-caret-left" aria-hidden="true"></i> ' + lesson_name).html_safe, "/" + course_name + "/" + params[:lesson_id].to_s, class: 'btn btn-back btn-default'
    end
  end

  def back_to_lesson
    if params[:id]
      forum = controller_name.classify.constantize.find(params[:id])
      course_name = forum.course_name.underscore + "s"
      lesson_name = Tags::LESSONS[course_name].keys[forum.lesson_id - 1][1]
      link_to ('<i class="fa fa-caret-left" aria-hidden="true"></i> ' + lesson_name).html_safe, "/" + course_name + "/" + forum.lesson_id.to_s, class: 'btn btn-back btn-default'
    else
      course_name = params[:course_name].underscore + "s"
      lesson_name = Tags::LESSONS[course_name].keys[params[:lesson_id].to_i - 1][1]
      link_to ('<i class="fa fa-caret-left" aria-hidden="true"></i> ' + lesson_name).html_safe, "/" + course_name + "/" + params[:lesson_id].to_s, class: 'btn btn-back btn-default'
    end
  end
  
  def create_flashcard
    content_tag(:button, '<i class="fa fa-plus-circle" aria-hidden="true"></i> Create Flashcard'.html_safe, class: 'trigger btn btn-flashcard')
  end

  def standard_git_workflow
    content_tag(:p, 
      '<i class="fa fa-github" aria-hidden="true"></i> Make sure to go through the <a href="#" data-toggle="modal" data-target="#git_workflow">standard git workflow</a>.'.html_safe, 
      class: 'standard_git_workflow')
  end
end
