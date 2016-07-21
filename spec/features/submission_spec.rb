feature "Submission links" do
  # given(:user) { FactoryGirl.create(:user) }

  before :each do
    @user = FactoryGirl.create(:user)
    login_as(@user, scope: :user)
  end

  scenario "User has not made any submissions yet" do
    another_user = FactoryGirl.create(:user)

    submission_by_another_user = FactoryGirl.create(:submission, 
      lesson_id: 4, 
      user_id: another_user.id, 
      approved: true,
      title: "Submission by Another User")    

    visit '/html_css_lessons/4'
    expect(page).to_not have_content "Submission by Another User"
    expect(page).to_not have_content "My Submission"
    expect(page).to have_content "Submit Your Work"
    expect(page).to have_content "1 student including #{another_user.name} have passed this assignment."
  end

  scenario "User has not made an approved submission yet" do
    submission_by_user = FactoryGirl.create(:submission, lesson_id: 4, user_id: @user.id, approved: false)
    another_user = FactoryGirl.create(:user)
    another_user_2 = FactoryGirl.create(:user)
    submission_by_another_user = FactoryGirl.create(:submission, 
      lesson_id: 4, 
      user_id: another_user.id, 
      approved: true,
      title: "Submission by Another User")
    submission_by_another_user = FactoryGirl.create(:submission, 
      lesson_id: 4, 
      user_id: another_user_2.id, 
      approved: true,
      title: "Submission by Another User 2")
    visit '/html_css_lessons/4'
    expect(page).to_not have_content "Submission by Another User"
    expect(page).to have_content "My Submission"
    expect(page).to_not have_content "Submit Your Work"
    expect(page).to have_content "2 students including #{another_user.name} #{another_user_2.name} have passed this assignment."
  end

  scenario "User has made an approved submission" do
    submission_by_user = FactoryGirl.create(:submission, lesson_id: 4, user_id: @user.id, approved: true)
    another_user = FactoryGirl.create(:user)
    submission_by_another_user = FactoryGirl.create(:submission, 
      lesson_id: 4, 
      user_id: another_user.id, 
      approved: true,
      title: "Submission by Another User")
    visit '/html_css_lessons/4'
    expect(page).to have_content "Submission by Another User"
    expect(page).to have_content "My Submission"
    expect(page).to_not have_content "Submit Your Work"
  end
end