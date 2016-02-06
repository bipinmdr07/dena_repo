task :create_forums => :environment do
  Forum.create(name: 'IntroLessons') unless Forum.where(name: 'IntroLessons').exists?
  Forum.create(name: 'HtmlCssLessons') unless Forum.where(name: 'HtmlCssLessons').exists?
  Forum.create(name: 'IdeatorLessons') unless Forum.where(name: 'IdeatorLessons').exists?
  Forum.create(name: 'RubyLessons') unless Forum.where(name: 'RubyLessons').exists?
  Forum.create(name: 'RubyCoreLessons') unless Forum.where(name: 'RubyCoreLessons').exists?
  Submission.create(name: 'IntroLessons') unless Submission.where(name: 'IntroLessons').exists?
  Submission.create(name: 'HtmlCssLessons') unless Submission.where(name: 'HtmlCssLessons').exists?
  Submission.create(name: 'IdeatorLessons') unless Submission.where(name: 'IdeatorLessons').exists?
  Submission.create(name: 'RubyLessons') unless Submission.where(name: 'RubyLessons').exists?
  Submission.create(name: 'RubyCoreLessons') unless Submission.where(name: 'RubyCoreLessons').exists?
end