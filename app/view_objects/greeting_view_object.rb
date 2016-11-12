class GreetingViewObject
  Greeting = Struct.new(:time_of_day, :icon)

  def display
    if midnight.upto(noon).include?(current_time)
     return Greeting.new("Morning","dashboard/sunrise.png")
    elsif noon.upto(five_pm).include?(current_time)
     return Greeting.new("Afternoon","dashboard/afternoon.png")
    elsif five_pm.upto(eight_pm).include?(current_time)
     return Greeting.new("Evening","dashboard/evening.png")
    else      
     return Greeting.new("Night","dashboard/night.png")
    end
  end

  private

  def current_time
    Time.current.to_i
  end

  def midnight
    Time.current.beginning_of_day.to_i
  end

  def noon
    Time.current.middle_of_day.to_i
  end

  def five_pm
    Time.current.change(hour: 17).to_i
  end

  def eight_pm
    Time.current.change(hour: 20).to_i     
  end
end