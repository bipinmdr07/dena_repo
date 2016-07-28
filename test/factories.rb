FactoryGirl.define do  

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
  end

end