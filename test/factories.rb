FactoryGirl.define do  factory :submission_comment do
    
  end
  factory :submission_reply do
    
  end
  factory :submission do
    
  end
  factory :html_css do
    
  end
  factory :reply do
    
  end
  factory :comment do
    title "Wtf does this mean"
    description "Idk wtf this means help me lol"
    lesson 1
    forum_id 1
  end
  factory :forum do
    
  end
  factory :contact do
    
  end
  factory :intro do
    
  end

	factory :user do
    sequence :email do |n|
      "random#{n}@email.com"
    end
    password "codingiscool"
    password_confirmation "codingiscool"
  end

end