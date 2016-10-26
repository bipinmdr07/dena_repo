require 'rails_helper'

RSpec.describe QuizOption, type: :model do
  describe "#self.randomize" do
    context "there are 4 options" do
      it "returns randomized options" do
        quiz_problem = FactoryGirl.create(:quiz_problem)
        correct_option = FactoryGirl.create(:quiz_option, correct: true, quiz_problem: quiz_problem)
        quiz_options = FactoryGirl.create_list(:quiz_option, 3, quiz_problem: quiz_problem)        
        
        expect(quiz_problem.quiz_options.randomize.length).to eq(4)  
      end
    end 

    context "there are more than 4 options" do
      it "returns 4 random options with atleast 1 correct answer" do
        quiz_problem = FactoryGirl.create(:quiz_problem)
        quiz_options = FactoryGirl.create_list(:quiz_option, 6, quiz_problem: quiz_problem)
        correct_options = FactoryGirl.create(:quiz_option, quiz_problem: quiz_problem, correct: true)

        expect(quiz_problem.quiz_options.randomize.length).to eq(4)
        expect(quiz_problem.quiz_options.randomize).to include(correct_options)
      end
    end
  end
end
