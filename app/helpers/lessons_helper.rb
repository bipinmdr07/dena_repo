module LessonsHelper
  def create_flashcard
    content_tag(:button, '<i class="fa fa-plus-circle" aria-hidden="true"></i> Create Flashcard'.html_safe, class: 'trigger btn btn-success')
  end

  def standard_git_workflow
    content_tag(:p, 'Make sure to go through the standard git workflow.')
  end
end
