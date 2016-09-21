source 'http://rubygems.org'
source 'http://rails-assets.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-turbolinks'
# use puma as web server
gem 'puma'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'devise'

gem 'bootstrap-sass', '~> 3.3.6'

gem 'simple_form'
gem 'mail_form'

# summernote editor
gem 'summernote-rails', '~> 0.8.1.1'

# uploading stuff
gem "figaro"
gem 'carrierwave'
gem 'mini_magick'
gem "fog", '1.36.0'

# active admin
gem 'activeadmin', github: 'activeadmin'
gem 'active_skin'

# tagging
gem 'acts-as-taggable-on', '~> 3.4'

# social media buttons
gem 'rails-assets-RRSSB'

# nice urls
gem 'friendly_id', '~> 5.1.0'

# activity log
gem 'public_activity'

# rankings
gem 'ranked-model', :git => 'https://github.com/mixonic/ranked-model.git'

# inline CSS for emails
gem 'premailer-rails'
gem 'nokogiri' # dependency for above

# slack api calls
gem 'slack-api'

# pagination
gem 'will_paginate', '~> 3.1.0'
gem 'will_paginate-bootstrap'

# elasticsearch
gem 'elasticsearch-model', git: 'git://github.com/elasticsearch/elasticsearch-rails.git'
gem 'elasticsearch-rails', git: 'git://github.com/elasticsearch/elasticsearch-rails.git'
gem 'bonsai-elasticsearch-rails'

# upvoting
gem 'acts_as_votable', '~> 0.10.0'

# better stylesheets
gem 'bourbon'

# omniauth
gem 'omniauth'
gem 'omniauth-github'
gem 'omniauth-facebook'

# social buttons
gem 'bootstrap-social-rails'

# SEO friendly
gem 'meta-tags'


# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'rails_12factor', group: [:production, :staging]

group :test do
  gem 'selenium-webdriver'
  gem 'capybara'
  gem 'database_cleaner'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.4'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'byebug'
  gem "factory_girl_rails", "~> 4.0"
end

group :development do
  # preview emails
  gem "letter_opener"
	gem 'pry-rails'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
