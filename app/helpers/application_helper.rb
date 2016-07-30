module ApplicationHelper

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
      ((current_user.progressions.where(course_name: controller_name).count.to_f / controller_name.constantize::LESSON_LENGTH.to_f) * 100).round(2)
    end
  end

  def lesson_completed(lesson_id, course_name=controller_name.classify.constantize)
    if current_user.progressions.where(course_name: course_name, lesson_id: lesson_id).count > 0
      '<i class="fa fa-check-circle progression_check" aria-hidden="true"></i>'.html_safe
    end
  end

	def title_for(course, chapter, lesson)
		course::LESSONS[chapter - 1][1][lesson - 1][1]
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
