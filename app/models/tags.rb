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
    "intro_lessons" => {
      [1, "Welcome to TECHRISE"] => %w(),
      [2, "Why use the TECHRISE Flashcard System?"] => %w(),
      [3, "How to Embed Code with TECHRISE Flashcards"] => %w(),
      [4, "Getting Started"] => %w()
    },
    "html_css_lessons" => {
      [1, "Guidelines for Learning"] => %w(),
      [2, "Building Your First Two HTML/CSS Projects"] => %w(),
      [3, "Introduction to HTML/CSS"] => %w(),
      [4, "Setting Up Your Environment"] => %w(),
      [5, "Getting Started"] => %w(),
      [6, "Learning about Divs"] => %w(),
      [7, "Adding some Padding"] => %w(),
      [8, "Creating a Background Image"] => %w(),
      [9, "Creating a perfect background image"] => %w(),
      [10, "Adding Margins"] => %w(),
      [11, "Adding a Profile Picture"] => %w(),
      [12, "Making everything look nice"] => %w(),
      [13, "Adding Social Buttons"] => %w(),
      [14, "Final Touches"] => %w(),
      [15, "Congratulations"] => %w()
    },
    "bootstrap_lessons" => {
      [1, "Introducing Twitter Bootstrap"] => %w(),
      [2, "Adding Twitter Bootstrap to Your Site"] => %w(),
      [3, "Adding a Navbar"] => %w(),
      [4, "Adding Content"] => %w(),
      [5, "Working with the Grid System"] => %w(),
      [6, "Adding Some More Content"] => %w(),
      [7, "Adding a Footer"] => %w(),
      [8, "Finishing Touches"] => %w(),
      [9, "CHALLENGE: Host Your Website"] => %w()
    },
    "ruby_lessons" => {
      [1, "Introduction to Ruby"] => %w(),
      [2, "Setting up your environment"] => %w(),
      [3, "Super Basic Command Line Crash Course"] => %w(),
      [4, "Your First Ruby Program"] => %w(),
      [5, "Math is easy"] => %w(),
      [6, "Objects and Methods"] => %w(),
      [7, "Variables"] => %w(),
      [8, "Arrays"] => %w(),
      [9, "Hashes"] => %w(),
      [10, "Looping and Iterating"] => %w(),
      [11, "Defining our own methods"] => %w(),
      [12, "Conditionals and Logical Operators"] => %w(),
      [13, "Introduction to Object Oriented Programming"] => %w(),
      [14, "Classes"] => %w(),
      [15, "Instance Variables"] => %w(),
      [16, "attr_reader and attr_writer"] => %w(),
      [17, "Instance Methods, Class Methods, Encapsulation"] => %w(),
      [18, "Constant Variables"] => %w(),
      [19, "Challenge: Building a Deck of Cards"] => %w(),
      [30, "Foobar Problem"] => %w(foobar),
      [31, "Test-First Ruby: Hello"] => %w(),
      [32, "Challenge: Temperature Conversion"] => %w()
    },
    "command_line_lessons" => {
      [1, "4 Commands You Need to Know"] => %w(command line),
      [2, "Learn the Command Line"] => %w(command line)
    },
    "ruby_core_lessons" => {
      [1, "Practice, Practice, Practice"] => %w(ruby),
      [2, "Coding Challenge: Check Palindrome"] => %w(ruby),
      [3, "Coding Challenge: String Compressor"] => %w(ruby),
      [4, "Coding Challenge: Square Each Digits"] => %w(ruby)
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
      [17, "Setting Up the Static Pages Controller"] => %w(),
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
      [33, "Setting up Upvoting"] => %w(),
      [34, "Setting up our Controllers"] => %w(),
      [35, "Writing the Front End"] => %w(),
      [36, "What is AJAX?"] => %w(),
      [37, "Sending an AJAX Request"] => %w(),
      [38, "Re-rendering the Page"] => %w(),
      [39, "Final Touches"] => %w()
    },
    "javascript_lessons" => {
      [1, "Learning the Basics"] => %w(),
      [2, "Using jQuery"] => %w()
    },
    "github_lessons" => {
      [1, "Git Real"] => %w(),
      [2, "Try Git"] => %w(),
      [3, "Git - the simple guide"] => %w(),
      [4, "Going Deeper"] => %w()
    },
    "rspec_blog_lessons" => {
      [1, "Why test?"] => %w(),
      [2, "What is RSpec?"] => %w(),
      [3, "Self-Directed Lesson: Setting up your Web Dev Environment"] => %w(),
      [4, "Self-Directed Lesson: Setting Up Git"] => %w(),
      [5, "Self-Directed Lesson: Installing Bootstrap"] => %w(),
      [6, "Self-Directed Lesson: Installing Simple Form"] => %w(),
      [7, "Self Directed Lesson - Adding a Navbar"] => %w(),
      [8, "Installing RSpec"] => %w(),
      [9, "Self-Directed Lesson: Creating the Posts Controller and Model"] => %w(),
      [10, "Self-Directed Lesson: Setting Up Routes"] => %w(),
      [11, "Self-Directed Lesson: Setting up CRUD Actions"] => %w(),
      [12, "What is TDD?"] => %w(),
      [13, "Testing the index action"] => %w(),
      [14, "Testing the show action"] => %w(),
      [15, "Self-Directed Lesson: Writing the show action"] => %w(),
      [16, "Testing the new action"] => %w(),
      [17, "Testing the create action - Part 1"] => %w(),
      [18, "Self-Directed Lesson: Setting Up Validations"] => %w(),
      [19, "Testing the create action - Part 2"] => %w(),
      [20, "Self-Directed Lesson: Testing the edit action"] => %w(),
      [21, "Testing the update action"] => %w(),
      [22, "Testing the destroy action"] => %w(),
      [23, "Model Tests"] => %w(),
      [24, "Self-Directed Lesson: Tidying things up"] => %w(),
      [25, "TDD: Final Thoughts"] => %w()
    },
    "mvc_lessons" => {
      [1, "What is MVC?"] => %w(),
      [2, "Overview of how everything works together"] => %w(),
      [3, "Overview of HTTP Methods"] => %w(),
      [4, "Rails for Zombies"] => %w(),
      [5, "What is schema.rb?"] => %w(),
      [6, "Adding and Updating Database Columns"] => %w()
    },
    "collaboration_lessons" => {
      [1, "Being a team player"] => %w(),
      [2, "Communicating Effectively"] => %w(),
      [3, "Agile"] => %w(),
      [4, "Scrum"] => %w(),
      [5, "Trello"] => %w(),
      [6, "Slack"] => %w(),
      [7, "Github"] => %w(),
      [8, "Continuous Integration"] => %w(),
      [9, "Pair Programming"] => %w(),
      [10, "How to communicate effectively online"] => %w(),
      [11, "Making Awesome Pull Requests"] => %w(),
      [12, "Code Reviews"] => %w(),
    },
    "skill_academy_lessons" => {
      [1, "Introduction"]=>[],
      [1, "Self-Directed Lesson: Setting up your Web Dev Environment"]=>[],
      [2, "Self-Directed Lesson: Setting Up Git and Heroku"]=>[],
      [3, "Setting up Continuous Integration"]=>[],
      [5, "Self-Directed Lesson: Installing Bootstrap"]=>[],
      [6, "Self-Directed Lesson: Installing Simple Form"]=>[],
      [8, "Self-Directed Lesson: Installing RSpec"]=>[],
      [9, "Self-Directed Lesson: Installing Factory Girl"]=>[],
      [7, "Choosing a template"]=>[],
      [8, "Integrating the template with a Rails application"]=>[],
      [9, ""]=>[],
      [10, "As a user, I should be able to log in/log out"]=>[],
      [12, "As a user, I should be able to edit my profile"]=>[],
      [13, "Setting Up Routes"]=>[],
      [14, "Setting up CRUD Actions"]=>[],
      [11, "Creating the Posts Controller and Model"]=>[],
      [12, "Setting Up Validations"]=>[],
      [15, "Why TDD?"]=>[],
      [16, "Testing the index action"]=>[],
      [17, "Creating New Posts"]=>[],
      [18, "Individual Post Pages"]=>[],
      [19, "Editing Posts"]=>[],
      [20, "Deleting Posts"]=>[]
    }
  }

end
