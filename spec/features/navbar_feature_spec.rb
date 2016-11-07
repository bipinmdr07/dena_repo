feature "Top Nav" do
  scenario "User is a mentor" do
    mentor = FactoryGirl.create(:mentor)

    login_as(mentor, scope: :user)
    visit dashboard_path

    expect(page).to have_content "MENTOR LOGS"
    expect(page).to have_content "MENTOR GUIDELINES"
    expect(page).to have_content "MENTOR RESOURCES"
  end

  scenario "User is an admitted student" do
    admitted_student = FactoryGirl.create(:admitted_student)
    
    login_as(admitted_student, scope: :user)
    visit dashboard_path

    expect(page).to have_content "UNTIL GRADUATION"
  end

end
