module LessonsHelper
  def create_flashcard
    content_tag(:button, '<i class="fa fa-plus-circle" aria-hidden="true"></i> Create Flashcard'.html_safe, class: 'trigger btn btn-success')
  end

  def standard_git_workflow
    content_tag(:p, 
      '<i class="fa fa-github" aria-hidden="true"></i> Make sure to go through the <a href="#" data-toggle="modal" data-target="#git_workflow">standard git workflow</a>.'.html_safe, 
      class: 'standard_git_workflow')
  end
end
