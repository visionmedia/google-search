# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{Google Search}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["TJ Holowaychuk"]
  s.date = %q{2009-07-22}
  s.description = %q{Google Search API}
  s.email = %q{tj@vision-media.ca}
  s.extra_rdoc_files = ["lib/google-search/version.rb", "lib/google-search.rb", "README.rdoc", "tasks/docs.rake", "tasks/gemspec.rake", "tasks/spec.rake"]
  s.files = ["History.rdoc", "lib/google-search/version.rb", "lib/google-search.rb", "Rakefile", "README.rdoc", "spec/GEM_spec.rb", "spec/spec_helper.rb", "tasks/docs.rake", "tasks/gemspec.rake", "tasks/spec.rake", "Todo.rdoc", "Manifest", "Google Search.gemspec"]
  s.homepage = %q{http://github.com/visionmedia/google-search}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Google Search", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{google search}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Google Search API}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
