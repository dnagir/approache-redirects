require 'bundler/setup'
require 'sinatra'

ROOT = "http://ApproachE.com"
#ROOT = "http://dnagir.github.com/dnagir"

# Redirect
# http://blog.approache.com/2011/12/knockoutjs-validations-video.html
# to
# http://ApproachE.com/blog/knockoutjs-validations-video/
get %r[/(\d{4,4})/(\d{1,2})/(.+).html]i do |year, month, slug|
  redirect "#{ROOT}/blog/#{slug}/", 301
end



# Redirect
# http://blog.approache.com/search/label/DevTools
# to
# http://dnagir.github.com/dnagir/blog/categories/devtools/

# DevTool -> devtools
# asp.net -> asp-net
# ruby-on-rails -> ruby-on-rails

get '/search/label/:label' do |label|
  category = label.downcase.gsub(/\W/) { '-' }
  redirect "#{ROOT}/blog/categories/#{category}/", 301
end





# http://blog.approache.com/2011_12_01_archive.html
# =>
# http://approache.com/blog/archives/
get '/:year_:month_:day_archive.html' do
  redirect "#{ROOT}/blog/archives/", 301
end




# blog.ApproachE.com -> ApproachE.com/blog
get '/' do
  redirect "#{ROOT}/blog/", 301
end


# Feeds
# blog.approache.com/feeds/posts/default => FeedBurner
get '/feeds/posts/default' do
  redirect "http://feeds.feedburner.com/DmitriyNagirnyak", 301
end
