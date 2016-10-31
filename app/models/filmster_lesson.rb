class FilmsterLesson < Lesson
  COURSE_TITLE = "Filmster - Online Movie Review App"

  DURATION = 60

  PERIOD = "8"

  CHAPTERS = [
    Chapter.new("What is AJAX?"),
    Chapter.new("What is JSON?"),
    Chapter.new("What is an API?"),
    Chapter.new("Setting up your Application"),
    Chapter.new("First Steps"),
    Chapter.new("Using the OMDb API"),
    Chapter.new("Building the Rating Feature"),
    Chapter.new("Creating a Fluid UI"),
    Chapter.new("Building the User Profile Page"),
    Chapter.new("Building Follow Functionality"),
    Chapter.new("Sending Emails"),
    Chapter.new("Building the Timeline Feature"),
    Chapter.new("Displaying Useful Information"),
    Chapter.new("Final Touches")
  ]

  LESSONS = [
    Lesson.new(1, "Asynchronous Javascript And XML", CHAPTERS[0]),
    Lesson.new(2, "Javascript Object Notation", CHAPTERS[1]),
    Lesson.new(3, "Application Programming Interface", CHAPTERS[2]),

    Lesson.new(4, "Setting up your web development environment", CHAPTERS[3]),
    Lesson.new(5, "Self-Directed Lesson: Setting up Git and Heroku", CHAPTERS[3]),

    Lesson.new(6, "Self-Directed Lesson: Installing Bootstrap", CHAPTERS[4]),
    Lesson.new(7, "Self-Directed Lesson: Creating a static page to display movies", CHAPTERS[4]),
    Lesson.new(8, "Self-Directed Lesson: Setting up the navigation bar", CHAPTERS[4]),
    Lesson.new(9, "Self-Directed Lesson: Setting up flash messages", CHAPTERS[4]),    
    Lesson.new(10, "Self-Directed Lesson: Setting up the User Model", CHAPTERS[4]),
    Lesson.new(11, "Self-Direct Lesson: Installing Carrierwave", CHAPTERS[4]),
    Lesson.new(12, "Setting up RSpec and FactoryGirl", CHAPTERS[4]),

    Lesson.new(13, "Taking a look at the API", CHAPTERS[5]),
    Lesson.new(14, "Your first AJAX GET Request", CHAPTERS[5]),
    Lesson.new(15, "Displaying movies based on search query", CHAPTERS[5]),
    Lesson.new(16, "Displaying individual movie details", CHAPTERS[5]),

    Lesson.new(17, "Saving movies into the database", CHAPTERS[6]),
    Lesson.new(18, "Setting up ratings", CHAPTERS[6]),
    Lesson.new(19, "Service Objects", CHAPTERS[6]),
    Lesson.new(20, "Building the movie show page", CHAPTERS[6]),
    Lesson.new(21, "Setting up upvotes", CHAPTERS[6]),

    Lesson.new(22, "Masonry Plugin", CHAPTERS[7]),

    Lesson.new(23, "Fetching movies reviewed by the user using AJAX", CHAPTERS[8]),

    Lesson.new(24, "Setting up relationships", CHAPTERS[9]),
    Lesson.new(25, "Using AJAX to dynamically update following count", CHAPTERS[9]),
    Lesson.new(26, "Fetching followers and following using AJAX", CHAPTERS[9]),

    Lesson.new(27, "ActionMailer", CHAPTERS[10]),

    Lesson.new(28, "Querying for ratings by following users", CHAPTERS[11]),
    Lesson.new(29, "Self-Directed Lesson: Displaying the ratings using AJAX", CHAPTERS[11]),

    Lesson.new(30, "Displaying most reviewed movies", CHAPTERS[12]),
    Lesson.new(31, "Displaying recently reviewed movies", CHAPTERS[12]),

    Lesson.new(32, "Self-Directed Lessons: Designing the Page", CHAPTERS[13]),
    Lesson.new(33, "Next Steps", CHAPTERS[13])
  ]


end
