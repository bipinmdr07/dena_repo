feature "Lesson show page" do

  scenario "Accessing a lesson when the user has access" do
    user = FactoryGirl.create(:user, github_access: true)
    login_as(user, scope: :user)

    visit "/github_lessons/1"

    expect(page).to have_content "It's a video giving an awesome introduction to Git."
  end

  scenario "Accessing a lesson when the user doesn't have access" do
    user = FactoryGirl.create(:user, github_access: false)
    login_as(user, scope: :user)

    visit "/github_lessons/1"

    expect(page).to_not have_content "It's a video giving an awesome introduction to Git."
    end 
end
