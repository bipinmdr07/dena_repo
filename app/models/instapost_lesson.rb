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
        [14, "Editing and Updating Ideas"],
        [15, "Validate User Input - Validations"],
        [16, "Deleting Ideas and Adding Links"]
      ]
    ],
    ["Adding Other Pages",
      [
        [17, "Routing"],
        [18, "Adding the About Page"],
        [19, "Configuring the Random Page"]
      ]
    ],
    ["Final Touches",
      [
        [20, "Adding Pagination"],
        [21, "Last Few Tweaks"],
        [22, "Congratulations!"]
      ]
    ]
  ]
end
