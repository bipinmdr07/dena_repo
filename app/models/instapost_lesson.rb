class InstapostLesson < Lesson
  COURSE_TITLE = "Instapost - Share your photos online"

  DURATION = 30

  PERIOD = "4 ~ 5"

  CHAPTERS = [
    Chapter.new("Setting Up Your App"),
    Chapter.new("First Steps"),
    Chapter.new("Adding User Authentication"),
    Chapter.new("Setting Up Photo Uploading"),
    Chapter.new("Setting Up Posts"),
    Chapter.new("Adding Comments to Posts"),
    Chapter.new("Adding a User Profile Page"),
    Chapter.new("Making everything look amazing"),
    Chapter.new("Adding Likes to Posts"),
    Chapter.new("Refactoring to Implement Best Practices")
  ]

  LESSONS = [
    Lesson.new(1, "Setting up your Web Dev Environment", CHAPTERS[0]),
    Lesson.new(2, "Setting Up Git", CHAPTERS[0]),

    Lesson.new(3, "Creating Wireframes", CHAPTERS[1]),
    Lesson.new(4, "Self-Directed Lesson: Installing Bootstrap", CHAPTERS[1]),

    Lesson.new(5, "Installing Devise", CHAPTERS[2]),
    Lesson.new(6, "Creating the User Model", CHAPTERS[2]),

    Lesson.new(7, "Installing Carrierwave", CHAPTERS[3]),
    Lesson.new(8, "(Optional) Integrating Amazon S3 with Carrierwave", CHAPTERS[3]),

    Lesson.new(9, "Creating the models and controllers", CHAPTERS[4]),
    Lesson.new(10, "Setting up the Routes", CHAPTERS[4]),
    Lesson.new(11, "Adding Log in/Log Out/Sign Up Links", CHAPTERS[4]),
    Lesson.new(12, "Setting Up User Forms", CHAPTERS[4]),
    Lesson.new(13, "Creating Posts", CHAPTERS[4]),
    Lesson.new(14, "Writing the Post Backend", CHAPTERS[4]),
    Lesson.new(15, "Displaying the Posts", CHAPTERS[4]),
    Lesson.new(16, "Updating Posts", CHAPTERS[4]),
    Lesson.new(17, "Using filters", CHAPTERS[4]),
    Lesson.new(18, "Deleting Posts", CHAPTERS[4]),
    Lesson.new(19, "Displaying Individual Posts", CHAPTERS[4]),

    Lesson.new(20, "Creating the models and controllers", CHAPTERS[5]),
    Lesson.new(21, "Self-Directed Lesson: Setting up Database Relations", CHAPTERS[5]),
    Lesson.new(22, "Setting up routes", CHAPTERS[5]),
    Lesson.new(23, "Posting Comments", CHAPTERS[5]),
    Lesson.new(24, "Creating the Comments Form", CHAPTERS[5]),
    Lesson.new(25, "Self-Directed Lesson: Displaying the comments", CHAPTERS[5]),
    Lesson.new(26, "Self-Directed Lesson: Deleting comments", CHAPTERS[5]),
    Lesson.new(27, "Deleting Comments Part 2", CHAPTERS[5]),

    Lesson.new(28, "Displaying user info", CHAPTERS[6]),

    Lesson.new(29, "Setting the basic styling", CHAPTERS[7]),
    Lesson.new(30, "Self-Directed Lesson: Styling the navbar", CHAPTERS[7]),
    Lesson.new(31, "Self-Directed Lesson: Styling Posts", CHAPTERS[7]),
    Lesson.new(32, "Self-Directed Lesson: Styling the Profile Page", CHAPTERS[7]),

    Lesson.new(33, "Setting up Upvoting", CHAPTERS[8]),
    Lesson.new(34, "Setting up our Controllers", CHAPTERS[8]),
    Lesson.new(35, "Writing the Front End", CHAPTERS[8]),
    Lesson.new(36, "What is AJAX?", CHAPTERS[8]),
    Lesson.new(37, "Sending an AJAX Request", CHAPTERS[8]),
    Lesson.new(38, "Re-rendering the Page", CHAPTERS[8]),
    Lesson.new(39, "Final Touches", CHAPTERS[8]),

    Lesson.new(40, "Eager Loading and the N+1 Query Problem", CHAPTERS[9]),
    Lesson.new(41, "The Law of Demeter and Delegation", CHAPTERS[9])
  ]
end
