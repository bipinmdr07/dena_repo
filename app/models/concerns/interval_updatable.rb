module IntervalUpdatable
  extend ActiveSupport::Concern

  included do
    scope :today, -> { where(archived: false)
                    .where(["repetition_date <= ?", Date.today])
                    .order("repetition_date ASC") }
    scope :unstudied, -> { where(repetition_date: nil) }    
  end

  def update_interval!(quality_response)
    IntervalUpdater.new(card: self, quality_response: quality_response).update_card!
  end
end
