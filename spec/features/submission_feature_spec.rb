feature "Submission links" do

  scenario "User has not made any submissions yet" do
    user = FactoryGirl.create(:user)    
    another_user = FactoryGirl.create(:user)
    submission_by_another_user = FactoryGirl.create(:submission, 
      lesson_id: 15, 
      user_id: another_user.id, 
      approved: true,
      title: "Submission by Another User")    

    login_as(user, scope: :user)
    visit '/html_css_lessons/15'

    expect(page).to_not have_content "Submission by Another User"
    expect(page).to_not have_content "My Submission"
    expect(page).to have_content "Submit your work"
    expect(page).to have_content "1 student including #{another_user.name} have passed this assignment."
  end

  scenario "User has not made an approved submission yet" do
    user = FactoryGirl.create(:user)
    submission_by_user = FactoryGirl.create(:submission, lesson_id: 15, user_id: user.id, approved: false)
    another_user = FactoryGirl.create(:user)
    another_user_2 = FactoryGirl.create(:user)
    submission_by_another_user = FactoryGirl.create(:submission, 
                                                    lesson_id: 15, 
                                                    user_id: another_user.id, 
                                                    approved: true,
                                                    title: "Submission by Another User")
    submission_by_another_user_2 = FactoryGirl.create(:submission, 
                                                      lesson_id: 15, 
                                                      user_id: another_user_2.id, 
                                                      approved: true,
                                                      title: "Submission by Another User 2")

    login_as(user, scope: :user)
    visit '/html_css_lessons/15'

    expect(page).to_not have_content "Submission by Another User"
    expect(page).to have_content "My Submission"
    expect(page).to_not have_content "Submit your work"
    expect(page).to have_content "2 students including #{another_user.name} #{another_user_2.name} have passed this assignment."
  end

  scenario "User has made an approved submission" do
    user = FactoryGirl.create(:user)
    submission_by_user = FactoryGirl.create(:submission, lesson_id: 15, user_id: user.id, approved: true)
    another_user = FactoryGirl.create(:user)
    submission_by_another_user = FactoryGirl.create(:submission, 
                                                    lesson_id: 15, 
                                                    user_id: another_user.id, 
                                                    approved: true,
                                                    title: "Submission by Another User")

    login_as(user, scope: :user)
    visit '/html_css_lessons/15'

    expect(page).to have_content "#{submission_by_another_user.title}"
    expect(page).to have_content "My Submission"
    expect(page).to_not have_content "Submit your work"
  end

  scenario "User is an admin" do
    user = FactoryGirl.create(:user, admin: true)    
    another_user = FactoryGirl.create(:user)
    another_user_2 = FactoryGirl.create(:user)
    another_user_3 = FactoryGirl.create(:user)
    submission_by_another_user = FactoryGirl.create(:submission, 
      lesson_id: 15, 
      user_id: another_user.id, 
      approved: true,
      title: "Submission by Another User")
    submission_by_another_user_2 = FactoryGirl.create(:submission, 
      lesson_id: 15, 
      user_id: another_user_2.id, 
      approved: true,
      title: "Submission by Another User 2")
    submission_by_another_user_3 = FactoryGirl.create(:submission, 
      lesson_id: 15, 
      user_id: another_user_3.id, 
      approved: false,
      title: "Submission by Another User 3")

    login_as(user, scope: :user)
    visit '/html_css_lessons/15'

    expect(page).to have_content "Submission by Another User"
    expect(page).to have_content "Submission by Another User 2"
    expect(page).to have_content "Submission by Another User 3"
    expect(page).to have_content "2 students including #{another_user.name} #{another_user_2.name} have passed this assignment."
  end

  scenario "There are no submissions yet" do
    user = FactoryGirl.create(:user)

    login_as(user, scope: :user)
    visit '/html_css_lessons/15'
    
    expect(page).to have_content "No submissions have been made for this assignment yet."
  end
end