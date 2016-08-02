FactoryGirl.define do  

  factory :mentor_session do
    private_details "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                      quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                      consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                      cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                      proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    public_details "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                      quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                      consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                      cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                      proident, sunt in culpa qui officia deserunt mollit anim id est laborum."                    
    homework_assigned "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                      quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                      consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                      cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                      proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    session_date DateTime.tomorrow                                            
  end

  factory :invalid_mentor_session, class: 'MentorSession' do
    private_details nil
    public_details nil                
    homework_assigned nil
    session_date nil                                   
  end

  factory :student_session do
    private_details "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                      quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                      consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                      cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                      proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    public_details "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                      quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                      consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                      cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                      proident, sunt in culpa qui officia deserunt mollit anim id est laborum."                    
    motivation_level "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                      quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                      consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                      cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                      proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  end

  factory :invalid_student_session, class: 'MentorSession' do
    private_details nil
    public_details nil                
    motivation_level nil
  end

  factory :card do
    
  end

  factory :admin_user do
    
  end

  factory :reply do
    content "content"
  end

  factory :invalid_reply, class: 'Reply' do
    content nil
  end

  factory :submission_reply do
    content "content"
  end

  factory :invalid_submission_reply, class: "SubmissionReply" do
    content nil
  end

  factory :submission do
    title "Submission Comment Title"
    content "content"
    lesson_id 1
    course_name "HtmlCssLesson"
  end
  
  factory :invalid_submission, class: 'Submission' do
    title nil
    content nil
    lesson_id 1
    course_name "HtmlCssLesson"
  end

  factory :question do
    title "Question Title"
    content "content"
    lesson_id 1
    course_name "HtmlCssLesson"
  end

  factory :mentor_post, class: 'Question' do
    title "Question Title"
    content "content"
    lesson_id nil
    course_name nil
    mentor_post true
  end
  
  factory :invalid_question, class: 'Question' do
    title nil
    content nil
    lesson_id 1
    course_name "HtmlCssLesson"
  end

	factory :user do
    sequence :email do |n|
      "random#{n}@email.com"
    end
    password "codingiscool"
    password_confirmation "codingiscool"
    name "Coder Taro"
    first_name "Coder"
    last_name "Taro"
  end

  factory :mentor, class: "User" do
    sequence :email do |n|
      "random_mentor#{n}@email.com"
    end
    password "codingiscool"
    password_confirmation "codingiscool"
    name "Coder Taro"
    first_name "Coder"
    last_name "Taro"
    mentor true
  end

  factory :mentor, class: "User" do
    sequence :email do |n|
      "random_mentor#{n}@email.com"
    end
    password "codingiscool"
    password_confirmation "codingiscool"
    name "Coder Taro"
    mentor true
  end

end