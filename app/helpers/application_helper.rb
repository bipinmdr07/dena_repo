module ApplicationHelper
  def markdown(text)
    options = {
      filter_html:     false,
      hard_wrap:       true, 
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true, 
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true,
      fenced_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

  def og_description(description)
    content_for(:description) { description }
  end

  def og_image(image)
    content_for(:og_image) { image }
  end

  def og_title(page_title)
    content_for(:og_title) { page_title }
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

  def display_date(datetime)
    begin
      datetime.strftime("%m/%d/%Y")
    rescue
    end
  end

  def display_datetime(datetime)
    begin
      datetime.strftime("%m/%d/%Y %l:%M %p")
    rescue
      # display nothing
    end
  end

  def progress(controller_name)
    if controller_name.empty?
      0.0
    else
      ((current_user.progressions.where(course_name: controller_name).count.to_f / controller_name.constantize.lesson_length.to_f) * 100).round(2)
    end
  end

  def lesson_completed(bool)
    return unless bool
    '<i class="fa fa-check-circle progression_check" aria-hidden="true"></i>'.html_safe
  end

	def title_for(course, lesson_id)
		course::LESSONS.select{|lesson| lesson.id == lesson_id}.first.title
	end

  def has_access?(course_access)
    # current_user[course_access + "_access"] is essentially 
    # the same as current_user.intro_access when course_access == "intro"
    return false unless current_user[course_access + "_access"]
    true
  end

  def resource_name
    :user
  end

  def resource_class 
     User 
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
end
