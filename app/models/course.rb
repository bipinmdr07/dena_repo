class Course
  TRACKS = [
    Track.new(number: 1,
              title: "Introduction to Software Engineering",
              description: "You'll gain the basic skillset of front end development by developing real web pages using HTML, CSS, and Bootstrap. You'll build multiple web pages including a modern-looking resume page and a portfolio website to showcase yourskills.",
              icons: ["landing_page/html.png", "Ruby_logo.png"],
              timeline: "1 ~ 2",
              courses: ["IntroLesson", "HtmlCssLesson", "RubyLesson"]),


    Track.new(number: 2,
              title: "Ruby on Rails Application", 
              description: "You'll build an Idea Sharing app using the Ruby on Rails framework, HTML, and CSS. You'll learn the basics of MVC framework, how to use Git for version control, and you'll launch your application live with professional tools.",
              icons: ["landing_page/html.png", "Ruby_logo.png", "landing_page/ruby_on_rails.png"],
              timeline: "2 ~ 3",
              courses: ["IdeatorLesson", "MvcLesson"]),

    Track.new(number: 3,
              title: "User Features and SNS", 
              description: "Build a complete clone of Instagram while implementing user authentication, photo uploading, AJAX, and database relations.",
              icons: ["landing_page/html.png"],
              timeline: "3 ~ 5",
              courses: ["RubyCoreLesson", "InstapostLesson"]),

    Track.new(number: 4,
              title: "Javascript and Advanced Ruby on Rails", 
              description: "Build an online movie review web application with a fluid user interface with Javascript and AJAX while implementing software engineering best practices.",
              icons: ["landing_page/html.png"],
              timeline: "5 ~ 7",
              courses: ["JavascriptLesson", "FilmsterLesson"]),

    Track.new(number: 5,
              title: "Test Driven Development", 
              description: "Test Driven Development is an industry standard - learn about how to write and run automated software tests and release high quality code.",
              icons: ["landing_page/html.png"],
              timeline: "7 ~ 8",
              courses: ["RspecBlogLesson"]),

    Track.new(number: 6,
              title: "Data Structures and Algorithms", 
              description: "Data structures and algorithms are a core part of a top engineering team's interview process. Learn and implement the main data structures and algorithms to conquer the screening process.",
              icons: ["landing_page/html.png"],
              timeline: "7 ~ 8",
              courses: ["AlgorithmLesson"]),
  ]
end