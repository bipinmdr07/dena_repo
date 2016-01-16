# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Forum.create(name: 'Intro')
Forum.create(name: 'HtmlCss')
Forum.create(name: 'IdeatorLessons')
Submission.create(name: 'Intro')
Submission.create(name: 'HtmlCss')
Submission.create(name: 'IdeatorLessons')