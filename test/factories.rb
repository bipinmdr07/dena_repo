FactoryGirl.define do  factory :comment do
    
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