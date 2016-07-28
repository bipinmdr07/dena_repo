require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  test "User signed in should be able to access courses" do
  	user = FactoryGirl.create(:user)
    sign_in user
    get :courses
    assert_response :success
  end

  test "User not signed in shouldn't be able to access courses" do
    get :courses
    assert_response :redirect
  end

end
