module StaticPagesHelper
  def skills
		items = []
		items << ['Ruby on Rails', "Learn how to create dynamic apps with Ruby on Rails.", 'Ruby_logo.png']
		items << ['HTML/CSS', "Craft beautiful front-end designs with HTML and CSS.", 'HTML_CSS.svg.png']
		items << ['JavaScript/jQuery', "Make your websites interactive with JavaScript and jQuery.", 'javascript.png']
		items << ['Git/GitHub', "Learn what version control is and how you can use Git to collaborate with other awesome developers.", 'github.png']
		items << ['Team Communication', "Pair up with another developer to work on a project together. We teach you how to use tools effectively for project management.", 'team.png']
		items << ['Data Structures/Algorithms', "Learning data structures and algorithms are essential in your path to becoming a coder and will boost your logical thinking skills.", 'code.png']
  end
end
