require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://www.techrise.me'
SitemapGenerator::Sitemap.create do
  add '/', :changefreq => 'weekly', :priority => 0.9
  add '/about', :changefreq => 'weekly', :priority => 0.6
  add '/remote', :changefreq => 'weekly', :priority => 0.6
  add '/immersive', :changefreq => 'weekly', :priority => 0.9
  add '/contact_us', :changefreq => 'monthly', :priority => 0.2
  add '/blog', :changefreq => 'daily', :priority => 0.9
  add '/users/sign_in', :changefreq => 'monthly'
end
SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks