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
    question "What is HTML?"
    answer "HTML stands for Hyper Text Markup Language"
  end

  factory :admin_user, class: 'User' do
    sequence :email do |n|
      "random#{n}@email.com"
    end
    password "codingiscool"
    password_confirmation "codingiscool"
    name "Coder Taro"
    first_name "Coder"
    last_name "Taro"
    confirmed_at Time.zone.now
    prework_start_time Date.today - 4.weeks
    prework_end_date Date.today - 2.weeks
    start_date DateTime.now
    graduation_date DateTime.now + 2.months
    admitted true
    admin true
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
    confirmed_at Time.zone.now
    prework_start_time Date.today - 4.weeks
    prework_end_date Date.today - 2.weeks
    start_date DateTime.now
    graduation_date DateTime.now + 2.months
    admitted true
  end

  factory :admitted_student, class: 'User' do
    sequence :email do |n|
      "random#{n}@email.com"
    end
    password "codingiscool"
    password_confirmation "codingiscool"
    name "Coder Taro"
    first_name "Coder"
    last_name "Taro"
    confirmed_at Time.zone.now
    prework_start_time Date.today - 4.weeks
    prework_end_date Date.today - 2.weeks
    start_date DateTime.now
    graduation_date DateTime.now + 2.months
    admitted true
  end

  factory :prework_student, class: 'User' do
    sequence :email do |n|
      "random#{n}@email.com"
    end
    password "codingiscool"
    password_confirmation "codingiscool"
    name "Coder Taro"
    first_name "Coder"
    last_name "Taro"
    confirmed_at Time.zone.now
    prework_start_time Date.today
    prework_end_date Date.today + 4.days
    start_date nil
    graduation_date nil
    admitted false
  end

  factory :pre_prework_student, class: 'User' do
    sequence :email do |n|
      "random#{n}@email.com"
    end
    password "codingiscool"
    password_confirmation "codingiscool"
    name "Coder Taro"
    first_name "Coder"
    last_name "Taro"
    confirmed_at Time.zone.now
    prework_start_time nil
    prework_end_date nil
    start_date nil
    graduation_date nil
    admitted false
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
    confirmed_at Time.zone.now
  end

  factory :progression do
    lesson_id 1
    course_name "HtmlCssLesson"
  end

  factory :feedback do
    title "Confusion about this"
    course_name "HtmlCssLesson"
    content "Don't worry about memorizing all of the syntax, that will come with time and experience. If you forget the syntax, you can always just Google it."
    lesson_id 1
  end

  factory :invalid_feedback, class: "Feedback" do
    title "Confusion about this"
    course_name ""
    content "Don't worry about memorizing all of the syntax, that will come with time and experience. If you forget the syntax, you can always just Google it."
  end
end
