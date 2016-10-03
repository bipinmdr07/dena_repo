feature "Top Nav" do
  # given(:student) { FactoryGirl.create(:admitted_student) }
  # given(:mentor) { FactoryGirl.create(:mentor) }
  # given(:admitted_student) { FactoryGirl.create(:admitted_student)}
  # given(:prework_student) { FactoryGirl.create(:prework_student)}
  # given(:pre_prework_student) { FactoryGirl.create(:pre_prework_student)}

  #
  # before :each do
  #   @user = FactoryGirl.create(:user)
  #   login_as(@user, scope: :user)
  # end

  scenario "User is a mentor" do
    mentor = FactoryGirl.create(:mentor)

    login_as(mentor, scope: :user)
    visit dashboard_path

    expect(page).to have_content "MENTOR LOGS"
    expect(page).to have_content "MENTOR GUIDELINES"
    expect(page).to have_content "MENTOR RESOURCES"
  end


  scenario "User is a pre-work student that has not yet started" do
    pre_prework_student = FactoryGirl.create(:pre_prework_student)

    login_as(pre_prework_student, scope: :user)
    visit dashboard_path

    expect(page).to_not have_content "DAYS UNTIL END OF PREWORK"
    expect(page).to have_content "START PREWORK"
  end

  scenario "User is a pre-work student that has started" do
    prework_student = FactoryGirl.create(:prework_student)

    login_as(prework_student, scope: :user)
    visit dashboard_path

    expect(page).to have_content "DAYS UNTIL END OF PREWORK"
    expect(page).to_not have_content "START PREWORK"
  end

  scenario "User is an admitted student" do
    admitted_student = FactoryGirl.create(:admitted_student)
    
    login_as(admitted_student, scope: :user)
    visit dashboard_path

    expect(page).to have_content "UNTIL GRADUATION"
  end

end
