class Card < ApplicationRecord
  acts_as_taggable
  include PublicActivity::Model

  belongs_to :user
  belongs_to :deck

  before_save :update_code_syntax!

  validates :question, :answer, presence: true

  scope :today, -> { where(archived: false)
                    .where(["repetition_date <= ?", Date.today])
                    .order("repetition_date ASC") }

  scope :unstudied, -> { where(repetition_date: nil) }     

  delegate :title, to: :deck, prefix: true      

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
    syntax_builder = SyntaxBuilder.new(self)
    self.question = syntax_builder.question
    self.answer = syntax_builder.answer
  end  

  def update_interval!(quality_response)
    IntervalUpdater.new(card: self, quality_response: quality_response).update_card!
  end
end
