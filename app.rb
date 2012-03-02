require 'bundler/setup'
require 'sinatra'

# Redirect
# http://blog.approache.com/2011/12/knockoutjs-validations-video.html
# to
# http://ApproachE.com/blog/knockoutjs-validations-video/
get %r[/(\d{4,4})/(\d{1,2})/(.+).html]i do |year, month, slug|
  redirect "http://ApproachE.com/blog/#{slug}/", 301
end
