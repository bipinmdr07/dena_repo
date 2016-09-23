class SyntaxBuilder
  def initialize(card)
    @card = card
  end

  def question
    build_syntax(@card.question)
  end

  def answer
    build_syntax(@card.answer)
  end

  private

  def build_syntax(text)
    language = text.match(/\`(.*?)\`/) # returns `ruby`
    return text if language.nil?
    text = CGI.escapeHTML(text)
    text.gsub!(Regexp.new("#{language[0]}"), "<pre><code class='#{language[1]}'>")
    text << "</code></pre>" if text.gsub!(/\`end\`/, "</code></pre>").nil?
    return text
  end

end