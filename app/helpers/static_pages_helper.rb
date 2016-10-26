module StaticPagesHelper
  def skills
		items = []
    items << ['Ruby', "Learn how to create dynamic apps with Ruby on Rails.", 'Ruby_logo.png']
		items << ['Rails', "Learn how to create dynamic apps with Ruby on Rails.", 'landing_page/ruby_on_rails.png']
		items << ['HTML/CSS', "Craft beautiful front-end designs with HTML and CSS.", 'landing_page/html.png']
		items << ['JavaScript', "Make your websites interactive with JavaScript and jQuery.", 'landing_page/javascript.png']
		items << ['Git', "Learn what version control is and how you can use Git to collaborate with other awesome developers.", 'landing_page/github.png']
		items << ['Teamwork', "Pair up with another developer to work on a project together. We teach you how to use tools effectively for project management.", 'landing_page/teamwork.png']
		# items << ['Data Structures/Algorithms', "Learning data structures and algorithms are essential in your path to becoming a coder and will boost your logical thinking skills.", 'code.png']
  end
end
