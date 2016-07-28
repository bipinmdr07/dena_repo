require 'test_helper'

class IntroLessonsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  test "User signed in should be able to access intro" do
  	user = FactoryGirl.create(:user)
    sign_in user
    get :index
    assert_response :success
  end

  test "User not signed in shouldn't be able to access intro" do
    get :index
    assert_response :redirect
  end
end
