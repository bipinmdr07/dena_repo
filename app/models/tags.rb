class Tags < ActiveRecord::Base

  # put tags for each lesson here
  # generate links by doing something like below:

  # tag = "tag"
  # Tags::LESSONS.each do |key, value|
  #   value.each do |k,v|
  #     if v.include?(tag)
  #       puts key + "/" + k.first.to_s # => html_css_lessons/1
  #     end
  #   end
  # end

  LESSONS = {
    "html_css_lessons" => {
      [1, "After this, there is no turning back"] => ["tag"],
      [2, "Building Your First Four HTML/CSS Projects"] => ["tag"],
      [3, "Setting Up Your Environment"] => [""],
      [4, "Building a Simple Personal Resume Page in 25 minutes"] => [""],
      [5, "Introducing Twitter Bootstrap"] => [""],
      [6, "Adding Twitter Bootstrap to Your Site"] => [""],
      [7, "Adding a Navbar"] => [""],
      [8, "Adding Content"] => [""],
      [9, "Working with the Grid System"] => [""],
      [10, "Adding Some More Content"] => [""],
      [11, "Adding a Footer"] => [""],
      [12, "Finishing Touches"] => [""],
      [13, "CHALLENGE: Host Your Website"] => [""],
      [14, "CHALLENGE: Create a Mock of A Website"] => [""]
    },
    "ruby_lessons" => {
      [1, "Introduction to Ruby"] => [""],
      [2, "Ruby Fundamentals"] => [""],
      [3, "Foobar Problem"] => [""]
    },
    "ruby_core_lessons" => {
      [1, "Practice, Practice, Practice"] => [""],
      [2, "Codewars"] => [""]
    },
    "ideator_lessons" => {
      [1, "Setting up your Web Dev Environment"] => [""],
      [2, "Setting Up Git"] => [""],
      [3, "Creating Wireframes"] => [""],
      [4, "Creating your First Page"] => [""],
      [5, "Installing Bootstrap"] => [""],
      [6, "Self Directed Lesson - Adding a Navbar"] => [""],
      [7, "Styling the Navbar"] => [""],
      [8, "Adding a Footer"] => [""],
      [9, "Creating a Model"] => [""],
      [10, "Adding an Idea"] => [""],
      [11, "Styling our Index Page"] => [""],
      [12, "Creating a Form"] => [""],
      [13, "Moving the Form into a Modal"] => [""],
      [14, "Editing and Updating Ideas"] => [""],
      [15, "Validate User Input - Validations"] => [""],
      [16, "Deleting Ideas and Adding Links"] => [""],
      [17, "Routing"] => [""],
      [18, "Adding the About Page"] => [""],
      [19, "Configuring the Random Page"] => [""],
      [20, "Adding Pagination"] => [""],
      [21, "Last Few Tweaks"] => [""],
      [22, "Congratulations!"] => [""]
    }
  }

end