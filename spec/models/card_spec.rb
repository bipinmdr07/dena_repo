require 'rails_helper'

RSpec.describe Card, type: :model do
  it { should validate_presence_of :question }
  it { should validate_presence_of :answer }

  describe "update_code_syntax" do
    it "parses into markdown" do
      card = Card.new(question: "question", answer: "answer", user_id: 1)

      card.save
      card.reload

      expect(card.question).to eq("<p>question</p>\n")
      expect(card.answer).to eq("<p>answer</p>\n")
    end
  end
end
