
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'rubygems'
require 'google-search'
require 'rext/all'

HTML = File.dirname(__FILE__) + '/images.html'

File.open(HTML, 'w+') do |file|
  Google::Search.new(:image, :query => 'Cookies'.url_encode).each do |image|
    file.write %(<img src="#{image.uri}">)
  end
end

begin
  `open -a Safari #{HTML}`
rescue
  puts "Not on OSX? wtf? open #{HTML} in your browser to view the images"
end


