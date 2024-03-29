module LessonsHelper
  def get_lesson_title(course_name, lesson_id)
    course_name.constantize::LESSONS[lesson_id.to_i - 1].title
  end

  def get_lesson_url_string(course_name, lesson_id)
    '/' + course_name.underscore + "s/" + lesson_id.to_s    
  end

  def back_to_lesson
    if params[:id]
      forum = controller_name.classify.constantize.find(params[:id])
      course_name = forum.course_name.underscore + "s"
      lesson_name = forum.course_name.constantize::LESSONS[forum.lesson_id - 1].title
      link_to ('<i class="fa fa-caret-left" aria-hidden="true"></i> ' + lesson_name).html_safe, "/" + course_name + "/" + forum.lesson_id.to_s, class: 'btn btn-back btn-default'
    else
      course_name = params[:course_name].underscore + "s"
      lesson_name = params[:course_name].constantize::LESSONS[params[:lesson_id].to_i - 1].title
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
