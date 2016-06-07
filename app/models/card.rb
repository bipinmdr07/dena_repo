class Card < ActiveRecord::Base
  acts_as_taggable
  belongs_to :user
  before_save :update_code_syntax

  validates :user_id, :question, :answer, presence: true

  scope :today, -> { where(["repetition_date <= ?", Date.today]).order("repetition_date ASC") }

  def update_code_syntax
    new_question = code_syntax(question)
    question = new_question
    new_answer = code_syntax(answer)
    answer = new_answer
  end  

  def update_interval!(quality_response)
    @prev_ef = calculated_ef.nil? ? 0 : calculated_ef
    @prev_interval = calculated_interval.nil? ? 0 : calculated_interval
    @quality_response = quality_response

    @calculated_interval = nil
    @calculated_ef = nil
    @repetition_date = nil

    #if quality_response is below 3 start repetition from the begining, but without changing easiness_factor
    if @quality_response < 3

      @calculated_ef = @prev_ef
      @calculated_interval = 0
    else
      calculate_easiness_factor
      calculate_interval
    end
    calculate_date
    update(calculated_interval: @calculated_interval, calculated_ef: @calculated_ef, repetition_date: @repetition_date)
  end

  def interval
    @calculated_interval
  end

  def easiness_factor
    @calculated_ef
  end

  def next_repetition_date
    @repetition_date
  end

  private

  def code_syntax(text)
    language = text.match(/\`(.*?)\`/) # returns `ruby`
    return text if language.nil?
    text.gsub!(Regexp.new("#{language[0]}"), "<pre><code class='#{language[1]}'>")
    text << "</code></pre>" if text.gsub!(/\`end\`/, "</code></pre>").nil?
    return text
  end
  
  def calculate_interval
    if @prev_interval == 0
      @calculated_interval = 1
    elsif @prev_interval == 1
      @calculated_interval = 6
    else
      @calculated_interval = (@prev_interval*@prev_ef).to_i
    end
  end

  def calculate_easiness_factor
    @calculated_ef = @prev_ef+(0.1-(5-@quality_response)*(0.08+(5-@quality_response)*0.02))
    if @calculated_ef < 1.3
      @calculated_ef = 1.3
    end
    @calculated_ef
  end

  def calculate_date
    @repetition_date = Date.today + @calculated_interval
  end
end
