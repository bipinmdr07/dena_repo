require 'rails_helper'

RSpec.describe QuizProblem, type: :model do
  describe "#save_and_create_quiz_options!" do
    context "there are no options that are correct" do
      it "raises an exception" do
        quiz_problem_params = FactoryGirl.attributes_for(:quiz_problem).merge(mock_all_false_options)
        quiz_problem = QuizProblem.new(quiz_problem_params.except(:options))

        expect {
          quiz_problem.save_and_create_quiz_options!(quiz_problem_params)
        }.to raise_exception(Exceptions::MustHaveCorrectAnswerException)
      end
    end

    context "there is at least one quiz option that is correct" do
      it "returns true" do
        quiz_problem_params = FactoryGirl.attributes_for(:quiz_problem).merge(mock_options)
        quiz_problem = QuizProblem.new(quiz_problem_params.except(:options))

        expect(quiz_problem.save_and_create_quiz_options!(quiz_problem_params)).to eq(true)
      end

      it "saves the QuizProblem" do
        quiz_problem_params = FactoryGirl.attributes_for(:quiz_problem).merge(mock_options)
        quiz_problem = QuizProblem.new(quiz_problem_params.except(:options))

        expect { 
          quiz_problem.save_and_create_quiz_options!(quiz_problem_params)
        }.to change(QuizProblem, :count).by(1)
      end
    end
  end
end

def mock_options
  {options: [{content: 'content', correct: "false"},
             {content: 'content', correct: "false"},
             {content: 'content', correct: "true"},
             {content: 'content', correct: "false"}
            ].to_json}
end

def mock_all_false_options
  {options: [{content: 'content', correct: "false"},
             {content: 'content', correct: "false"},
             {content: 'content', correct: "false"},
             {content: 'content', correct: "false"}
            ].to_json}
end