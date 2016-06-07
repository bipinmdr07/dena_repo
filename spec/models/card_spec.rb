require 'rails_helper'

RSpec.describe Card, type: :model do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :question }
  it { should validate_presence_of :answer }

  describe "update_code_syntax" do
    context "when `ruby` is present" do
      it "should change code syntax" do
        question = "What is this?\n`ruby`\nif 1 == 2\n  puts 'Hi'\nelse\n  puts 'Bye'\nend\n`end`"
        answer = "`ruby`\nputs 'Bye'\n`end`"
        card = Card.create(user_id: 1, question: question, answer: answer)
        expect(card.question).to eq("What is this?\n<pre><code class='ruby'>\nif 1 == 2\n  puts 'Hi'\nelse\n  puts 'Bye'\nend\n</code></pre>")
        expect(card.answer).to eq("<pre><code class='ruby'>\nputs 'Bye'\n</code></pre>")
      end
    end

    context "when `` is not present" do
      it "should not change the text" do
        card = Card.create(user_id: 1, question: "Hi", answer: "Hi")
        expect(card.question).to eq("Hi")
        expect(card.answer).to eq("Hi")
      end
    end

    context "when 'ruby' but 'end' is not present" do
      it "should close the code tags" do
        question = "What is this?\n`ruby`\nif 1 == 2\n  puts 'Hi'\nelse\n  puts 'Bye'\nend\n"
        answer = "`ruby`\nputs 'Bye'\n"
        card = Card.create(user_id: 1, question: question, answer: answer)
        expect(card.question).to eq("What is this?\n<pre><code class='ruby'>\nif 1 == 2\n  puts 'Hi'\nelse\n  puts 'Bye'\nend\n</code></pre>")
        expect(card.answer).to eq("<pre><code class='ruby'>\nputs 'Bye'\n</code></pre>")
      end
    end
  end
end
