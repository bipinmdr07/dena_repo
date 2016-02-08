module ApplicationHelper
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
