require 'rails_helper'

RSpec.describe ProgressionsController, type: :controller do
  describe "POST #create" do
    let(:user) { FactoryGirl.create(:user) }
    context "when user is signed in" do

      before :each do
        sign_in user
      end

      it "should create new progression" do
          expect {
            post :create, progression: FactoryGirl.attributes_for(:progression, user_id: user.id), format: :js
          }.to change(Progression, :count).by(1)

      end

      context "when student has passed all submission for Html_Css" do
        it "should unlock the next lesson" do
          submission1 = FactoryGirl.create(:submission, user_id: user.id, lesson_id: 1, approved: true)
          submission2 = FactoryGirl.create(:submission, user_id: user.id, lesson_id: 2, approved: true)
          submission3 = FactoryGirl.create(:submission, user_id: user.id, lesson_id: 3, approved: true)

          FactoryGirl.create(:progression, user_id: user.id, course_name: "IntroLesson")
          (HtmlCssLesson::LESSON_LENGTH - 1).times do |i|
            FactoryGirl.create(:progression, user_id: user.id, lesson_id: i)
          end

          post :create, progression: FactoryGirl.attributes_for(:progression, user_id: user.id), format: :js

          user.reload
          expect(user.ruby_access).to be true
        end
      end

      context "when student has not passed all submission for Html_Css" do
        it "should not unlock the next lesson" do
          submission1 = FactoryGirl.create(:submission, user_id: user.id, lesson_id: 1, approved: false)
          submission2 = FactoryGirl.create(:submission, user_id: user.id, lesson_id: 2, approved: true)
          submission3 = FactoryGirl.create(:submission, user_id: user.id, lesson_id: 3, approved: true)

          FactoryGirl.create(:progression, user_id: user.id, course_name: "IntroLesson")
          (HtmlCssLesson::LESSON_LENGTH - 1).times do |i|
            FactoryGirl.create(:progression, user_id: user.id, lesson_id: i)
          end

          post :create, progression: FactoryGirl.attributes_for(:progression, user_id: user.id), format: :js

          user.reload
          expect(user.ruby_access).to be false
        end
      end



    end

    context "when user is not signed in" do
      it "should not create new progression" do
        expect {
          post :create, progression: FactoryGirl.attributes_for(:progression, user_id: user.id), format: :js
        }.to change(Progression, :count).by(0)

      end
    end
  end
end
