class InstapostLesson < ActiveRecord::Base
  COURSE_TITLE = "Instapost - Share your photos online"

  LESSON_LENGTH = 22

  LESSONS = [
    ["Setting Up Your App", 
      [
        [1, "Setting up your Web Dev Environment"],
        [2, "Setting Up Git"]
      ]
    ],
    ["First Steps", 
      [
        [3, "Creating Wireframes"],
        [4, "Self-Directed Lesson: Installing Bootstrap"]
      ]
    ],
    ["Adding User Authentication",
      [
        [5, "Installing Devise"],
        [6, "Creating the User Model"],
      ]
    ],
    ["Setting Up Photo Uploading",
      [
        [7, "Installing Carrierwave"],
        [8, "Integrating Amazon S3 with Carrierwave"],
      ]
    ],
    ["Setting up Posts",
      [
        [9, "Creating the models and controllers"],
        [10, "Setting up the Routes"],
        [11, "Adding Log in/Log Out/Sign Up Links"],
        [12, "Setting Up User Forms"],
        [13, "Creating Posts"],
        [14, "Writing the Post Backend"],
        [15, "Displaying the Posts"],
        [16, "Updating Posts"],
        [17, "Using filters"],
        [18, "Deleting Posts"],
        [19, "Displaying Individual Posts"]
      ]
    ],
    ["Adding Comments to Posts",
      [
        [20, "Creating the models and controllers"],
        [21, "Self-Directed Lesson: Setting up Database Relations"],
        [22, "Setting up routes"],
        [23, "Posting Comments"],
        [24, "Creating the Comments Form"],
        [25, "Self-Directed Lesson: Displaying the comments"],
        [26, "Self-Directed Lesson: Deleting comments"],
        [27, "Deleting Comments Part 2"]
      ]
    ],
    ["Adding a User Profile Page",
      [
        [28, "Displaying user info"]
      ]
    ],
    ["Making everything look amazing",
      [
        [29, "Setting the basic styling"],
        [30, "Self-Directed Lesson: Styling the navbar"],
        [31, "Self-Directed Lesson: Styling Posts"],
        [32, "Self-Directed Lesson: Styling the Profile Page"],
        [33, "Final Touches"]
      ]
    ]
  ]
end
