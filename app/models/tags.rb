class Tags < ActiveRecord::Base

  def self.get_links(tag)
    links = []
    Tags::LESSONS.each do |key, value|
      value.each do |k,v|
        if v.include?(tag)
          links << [key + "/" + k.first.to_s, k[1]] # => ["html_css_lessons/1", "After this, there is no turning back"]
        end
      end
    end
    return links
  end

  # put tags for each lesson here
  # generate links by using the self.get_links(tag) method

  LESSONS = {
    "html_css_lessons" => {
      [1, "After this, there is no turning back"] => %w(),
      [2, "Building Your First Four HTML/CSS Projects"] => %w(),
      [3, "Setting Up Your Environment"] => %w(),
      [4, "Building a Simple Personal Resume Page in 25 minutes"] => %w(),
      [5, "Introducing Twitter Bootstrap"] => %w(),
      [6, "Adding Twitter Bootstrap to Your Site"] => %w(),
      [7, "Adding a Navbar"] => %w(),
      [8, "Adding Content"] => %w(),
      [9, "Working with the Grid System"] => %w(),
      [10, "Adding Some More Content"] => %w(),
      [11, "Adding a Footer"] => %w(),
      [12, "Finishing Touches"] => %w(),
      [13, "CHALLENGE: Host Your Website"] => %w(),
      [14, "CHALLENGE: Create a Mock of A Website"] => %w()
    },
    "ruby_lessons" => {
      [1, "Introduction to Ruby"] => %w(ruby),
      [2, "Ruby Fundamentals"] => %w(ruby),
      [3, "Foobar Problem"] => %w(foobar)
    },
    "ruby_core_lessons" => {
      [1, "Practice, Practice, Practice"] => %w(ruby),
      [2, "Codewars"] => %w(ruby)
    },
    "ideator_lessons" => {
      [1, "Setting up your Web Dev Environment"] => %w(),
      [2, "Setting Up Git"] => %w(),
      [3, "Creating Wireframes"] => %w(),
      [4, "Creating your First Page"] => %w(),
      [5, "Installing Bootstrap"] => %w(),
      [6, "Self Directed Lesson - Adding a Navbar"] => %w(),
      [7, "Styling the Navbar"] => %w(),
      [8, "Adding a Footer"] => %w(),
      [9, "Creating a Model"] => %w(),
      [10, "Adding an Idea"] => %w(),
      [11, "Styling our Index Page"] => %w(),
      [12, "Creating a Form"] => %w(),
      [13, "Moving the Form into a Modal"] => %w(),
      [14, "Editing and Updating Ideas"] => %w(),
      [15, "Validate User Input - Validations"] => %w(),
      [16, "Deleting Ideas and Adding Links"] => %w(),
      [17, "Routing"] => %w(),
      [18, "Adding the About Page"] => %w(),
      [19, "Configuring the Random Page"] => %w(),
      [20, "Adding Pagination"] => %w(),
      [21, "Last Few Tweaks"] => %w(),
      [22, "Congratulations!"] => %w()
    },
    "instapost_lessons" => {
      [1, "Setting up your Web Dev Environment"] => %w(),
      [2, "Setting Up Git"] => %w(),
      [3, "Creating Wireframes"] => %w(),
      [4, "Self-Directed Lesson: Installing Bootstrap"] => %w(),
      [5, "Installing Devise"] => %w(),
      [6, "Creating the User Model"] => %w(),
      [7, "Installing Carrierwave"] => %w(),
      [8, "Integrating Amazon S3 with Carrierwave"] => %w(),
      [9, "Creating the models and controllers"] => %w(),
      [10, "Setting up the Routes"] => %w(),
      [11, "Adding Log in/Log Out/Sign Up Links"] => %w(),
      [12, "Setting Up User Forms"] => %w(),
      [13, "Creating Posts"] => %w(),
      [14, "Writing the Post Backend"] => %w(),
      [15, "Displaying the Posts"] => %w(),
      [16, "Updating Posts"] => %w(),
      [17, "Using filters"] => %w(),
      [18, "Deleting Posts"] => %w(),
      [19, "Displaying Individual Posts"] => %w(),
      [20, "Creating the models and controllers"] => %w(),
      [21, "Self-Directed Lesson: Setting up Database Relations"] => %w(),
      [22, "Setting up routes"] => %w(),
      [23, "Posting Comments"] => %w(),
      [24, "Creating the Comments Form"] => %w(),
      [25, "Self-Directed Lesson: Displaying the comments"] => %w(),
      [26, "Self-Directed Lesson: Deleting comments"] => %w(),
      [27, "Deleting Comments Part 2"] => %w(),
      [28, "Displaying user info"] => %w(),
      [29, "Setting the basic styling"] => %w(),
      [30, "Self-Directed Lesson: Styling the navbar"] => %w(),
      [31, "Self-Directed Lesson: Styling Posts"] => %w(),
      [32, "Self-Directed Lesson: Styling the Profile Page"] => %w(),
      [33, "Final Touches"] => %w()
    },
    "javascript_lessons" => {
      [1, "Learning the Basics"] => %w(),
      [2, "jQuery"] => %w()
    },
    "github_lessons" => {
      [1, "Git Real"] => %w(),
      [2, "Try Git"] => %w(),
      [3, "Git - the simple guide"] => %w()
    }
  }

end