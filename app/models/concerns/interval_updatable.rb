module IntervalUpdatable
  extend ActiveSupport::Concern

  included do
    scope :unstudied, -> { where(repetition_date: nil) }    
  end

  def update_interval!(quality_response)
    IntervalUpdater.new(card: self, quality_response: quality_response).update_card!
  end
end
