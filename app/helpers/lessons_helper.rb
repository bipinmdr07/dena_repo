module LessonsHelper
  def create_flashcard
    content_tag(:button, '<i class="fa fa-plus-circle" aria-hidden="true"></i> Create Flashcard'.html_safe, class: 'trigger btn btn-success')
  end
end
