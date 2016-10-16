class Card < ApplicationRecord
  acts_as_taggable
  include PublicActivity::Model
  include IntervalUpdatable

  belongs_to :user
  belongs_to :deck

  before_save :update_code_syntax!

  validates :question, :answer, presence: true  

  delegate :title, to: :deck, prefix: true      

  scope :today, -> { where(archived: false)
                    .where(["repetition_date <= ?", Date.today])
                    .order("repetition_date ASC") }

  def self.due
    self.today | self.unstudied
  end            

  def next_in_deck
    Card.where(deck: deck).where("id > ?", id).first
  end

  def prev_in_deck
    Card.where(deck: deck).where("id < ?", id).last
  end

  def update_code_syntax!
    self.question = MarkdownParser.new(question).parsed
    self.answer = MarkdownParser.new(answer).parsed
  end  
end
