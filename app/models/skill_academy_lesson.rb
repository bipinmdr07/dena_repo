class SkillAcademyLesson < Lesson
  COURSE_TITLE = "Skill Academy - A Skill Sharing Platform"

  DURATION = 60

  PERIOD = "8 ~ 10"

  CHAPTERS = [
    Chapter.new("Setting Up Your App"),
    Chapter.new("Installing Necessary Gems"),
    Chapter.new("Setting Up the Landing Page"),
    Chapter.new("Adding User Authentication"),
    Chapter.new("Setting Up Courses"),
    Chapter.new("Adding sections to courses"),
    Chapter.new("Adding lessons to sections"),
    Chapter.new("Setting up the course page"),
    Chapter.new("Building the Enrollments Feature"),
    Chapter.new("Setting Up Course Ratings"),
    Chapter.new("Designing the Instructor Profile Page"),
    Chapter.new("Adding Notifications"),
    Chapter.new("Additional Features")
  ]

  LESSONS = [

    Lesson.new(1, "Introduction", CHAPTERS[0]),
    Lesson.new(2, "Self-Directed Lesson: Setting up your Web Dev Environment", CHAPTERS[0]),
    Lesson.new(3, "Self-Directed Lesson: Setting Up Git and Heroku", CHAPTERS[0]),
    Lesson.new(4, "Setting up Continuous Integration", CHAPTERS[0]),

    Lesson.new(5, "Self-Directed Lesson: Installing Bootstrap", CHAPTERS[1]),
    Lesson.new(6, "Self-Directed Lesson: Installing Simple Form", CHAPTERS[1]),
    Lesson.new(7, "Self-Directed Lesson: Installing RSpec", CHAPTERS[1]),
    Lesson.new(8, "Self-Directed Lesson: Installing Factory Girl", CHAPTERS[1]),
    Lesson.new(9, "Self-Directed Lesson: Installing Pry-Rails", CHAPTERS[1]),

    Lesson.new(10, "Choosing a template", CHAPTERS[2]),
    Lesson.new(11, "Integrating the template with a Rails application", CHAPTERS[2]),
 
    Lesson.new(12, "As a student, I should be able to log in/log out", CHAPTERS[3]),

    Lesson.new(13, "As an instructor, I want to be able to create a new course", CHAPTERS[4]),
    Lesson.new(14, "As an instructor, I want to be able to see all of my courses", CHAPTERS[4]),
    Lesson.new(15, "As an instructor, I want to be able to view the details of a specific course", CHAPTERS[4]),
    Lesson.new(16, "As an instructor, I want to be able to edit/update a course", CHAPTERS[4]),
    Lesson.new(17, "As an instructor, I want to be able to delete a course", CHAPTERS[4]),

    Lesson.new(18, "As an instructor, I want to be able to add new sections to the course", CHAPTERS[5]),
    Lesson.new(19, "As an instructor, I want to be able be able to see all sections in the course page", CHAPTERS[5]),
    Lesson.new(20, "As an instructor, I want to be able to edit/update sections", CHAPTERS[5]),
    Lesson.new(21, "As an instructor, I want to be able to delete sections", CHAPTERS[5]),

    Lesson.new(22, "As an instructor, I want to be able to add new lessons to a section", CHAPTERS[6]),
    Lesson.new(23, "As an instructor, I want to be able to see all lessons in the course page", CHAPTERS[6]),
    Lesson.new(24, "As an instructor, I want to be able to edit/update lessons", CHAPTERS[6]),
    Lesson.new(25, "As an instructor, I want to be able to delete lessons", CHAPTERS[6]),

    Lesson.new(25, "As a student, I want to see all of the course details on the course page", CHAPTERS[7]),
    Lesson.new(26, "As a student, I want to be able to see the profile picture and introduction of the instructor", CHAPTERS[7]),

    Lesson.new(27, "As a student, I want to be able to enroll in courses", CHAPTERS[8]),
    Lesson.new(28, "As a student, I want to be able to unenroll from courses", CHAPTERS[8]),
    Lesson.new(29, "As a student, I want to be able to see all of my enrolled courses", CHAPTERS[8]),

    Lesson.new(30, "As a student, I want to be able to rate a course I have enrolled in", CHAPTERS[9]),
    Lesson.new(31, "As a student, I want to be able to delete a rating", CHAPTERS[9]),
    Lesson.new(32, "As a student, I want to be able to see the average rating of a course", CHAPTERS[9]),

    Lesson.new(33, "As a student, I should be able to see all courses taught by the instructor", CHAPTERS[10]),
    Lesson.new(34, "As a student, I should be able to see the number of courses taught by the instructor", CHAPTERS[10]),

    Lesson.new(35, "As an instructor, I want to be notified when a user enrolls/unenrolls in my course", CHAPTERS[11]),
    Lesson.new(36, "As an instructor, I want to be notified when a user rates my course", CHAPTERS[11]),

    Lesson.new(37, "As a student, I want to be search and sort/filter for courses", CHAPTERS[12]),
    Lesson.new(38, "As a student, I want to be able to recover courses that I've deleted", CHAPTERS[12]),
    Lesson.new(39, "As a student, I want to be able to recover sections that I've deleted", CHAPTERS[12]),
    Lesson.new(41, "As a student, I want to be able to recover lessons that I've deleted", CHAPTERS[12])
  ]
end
