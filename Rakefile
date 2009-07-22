
$:.unshift 'lib'
require 'GEM_NAME'
require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new "GEM_NAME", GEM_CLASS::VERSION do |p|
  p.author = "GEM_AUTHOR"
  p.email = "GEM_EMAIL"
  p.summary = "GEM_DESCRIPTION"
  p.url = "GEM_URL"
  p.runtime_dependencies = []
end

Dir['tasks/**/*.rake'].sort.each { |f| load f }