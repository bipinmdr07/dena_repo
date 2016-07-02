# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# Forum.create([{name: "test"}, {name: "Another"}])
# Examples:
# 
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Forum.create([
  {name: 'IntroLessons'}, 
  {name: 'HtmlCssLessons'}, 
  {name: 'IdeatorLessons'}, 
  {name: 'RubyLessons'}, 
  {name: 'RubyCoreLessons'}, 
  {name: 'InstapostLessons'},
  {name: 'GithubLessons'},
  {name: 'JavascriptLessons'},
  {name: 'MvcLessons'},
  {name: 'AlgorithmLessons'},
  {name: 'RspecBlogLessons'},
  {name: 'CommandLineLessons'}
])

Submission.create([
  {name: 'IntroLessons'}, 
  {name: 'HtmlCssLessons'}, 
  {name: 'IdeatorLessons'}, 
  {name: 'RubyLessons'}, 
  {name: 'RubyCoreLessons'}, 
  {name: 'GithubLessons'},
  {name: 'JavascriptLessons'},
  {name: 'MvcLessons'},
  {name: 'AlgorithmLessons'},
  {name: 'RspecBlogLessons'},
  {name: 'CommandLineLessons'}
])

AdminUser.create([
  {email: 'takehiromouri@gmail.com', password: 'tak22thegoat', password_confirmation: 'tak22thegoat'}, 
  {email: 'naztshinozaki@gmail.com', password: 'oreocookies', password_confirmation: 'oreocookies'}
])
