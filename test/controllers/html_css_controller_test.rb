require 'test_helper'

class HtmlCssControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  test "User signed in should be able to access html/css" do
  	user = FactoryGirl.create(:user)
    sign_in user
    get :index
    assert_response :success
  end

  test "User not signed in shouldn't be able to access html/css" do
    get :index
    assert_response :redirect
  end
end
