class SkillAcademyLesson < Lesson
  COURSE_TITLE = "Skill Academy - A Skill Sharing Platform"

  DURATION = 60

  PERIOD = "8 ~ 10"

  LESSONS = [
    ["Setting Up Your App", 
      [ 
        [1, "Introduction"],
        [2, "Self-Directed Lesson: Setting up your Web Dev Environment"],
        [3, "Self-Directed Lesson: Setting Up Git and Heroku"],
        [4, "Setting up Continuous Integration"]
      ]
    ],
    ["Installing Necessary Gems", 
      [
        [5, "Self-Directed Lesson: Installing Bootstrap"],
        [6, "Self-Directed Lesson: Installing Simple Form"],
        [7, "Self-Directed Lesson: Installing RSpec"],
        [8, "Self-Directed Lesson: Installing Factory Girl"],
        [9, "Self-Directed Lesson: Installing Pry-Rails"]
      ]
    ],
    ["Setting Up the Landing Page", 
      [
        [10, "Choosing a template"],
        [11, "Integrating the template with a Rails application"]
      ]
    ],
    ["Adding User Authentication",
      [         
        [12, "As a student, I should be able to log in/log out"]        
      ]
    ],    
    ["Setting Up Courses",
      [
        [13, "As an instructor, I want to be able to create a new course"],
        [14, "As an instructor, I want to be able to see all of my courses"],
        [15, "As an instructor, I want to be able to view the details of a specific course"],
        [16, "As an instructor, I want to be able to edit/update a course"],
        [17, "As an instructor, I want to be able to delete a course"]
      ]
    ],
    ["Adding sections to courses",
      [
        [18, "As an instructor, I want to be able to add new sections to the course"],
        [19, "As an instructor, I want to be able be able to see all sections in the course page"],
        [20, "As an instructor, I want to be able to edit/update sections"],
        [21, "As an instructor, I want to be able to delete sections"]
      ]
    ],
    ["Adding lessons to sections",
      [
        [22, "As an instructor, I want to be able to add new lessons to a section"],
        [23, "As an instructor, I want to be able to see all lessons in the course page"],
        [24, "As an instructor, I want to be able to edit/update lessons"],
        [25, "As an instructor, I want to be able to delete lessons"]
      ]
    ],
    ["Setting up the course page",
      [
        [25, "As a student, I want to see all of the course details on the course page"],
        [26, "As a student, I want to be able to see the profile picture and introduction of the instructor"]
      ]
    ],
    ["Building the Enrollments Feature",
      [
        [27, "As a student, I want to be able to enroll in courses"],
        [28, "As a student, I want to be able to unenroll from courses"],
        [29, "As a student, I want to be able to see all of my enrolled courses"]
      ]
    ],
    ["Setting Up Course Ratings",
      [
        [30, "As a student, I want to be able to rate a course I have enrolled in"],
        [31, "As a student, I want to be able to delete a rating"],
        [32, "As a student, I want to be able to see the average rating of a course"]
      ]
    ],
    ["Designing the Instructor Profile Page",
      [
        [33, "As a student, I should be able to see all courses taught by the instructor"],
        [34, "As a student, I should be able to see the number of courses taught by the instructor"]
      ]
    ],
    ["Adding a Notifications",
      [
        [35, "As an instructor, I want to be notified when a user enrolls/unenrolls in my course"],
        [36, "As an instructor, I want to be notified when a user rates my course"]
      ]
    ],
    ["Additional Features",
      [
        [37, "As a student, I want to be search and sort/filter for courses"],
        [38, "As a student, I want to be able to recover courses that I've deleted"],
        [39, "As a student, I want to be able to recover sections that I've deleted"],
        [41, "As a student, I want to be able to recover lessons that I've deleted"]
      ]
    ]
  ]
end
