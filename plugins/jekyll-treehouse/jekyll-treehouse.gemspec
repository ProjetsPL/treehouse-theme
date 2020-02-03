# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require "jekyll-treehouse/version"

Gem::Specification.new do |spec|
  spec.name        = "jekyll-treehouse"
  spec.summary     = "Treehouse GEM"
  spec.version     = Jekyll::Treehouse::VERSION
  spec.authors     = ["Bartlomiej Matlega"]
  spec.email       = "support@github.com"
  spec.homepage    = ""
  spec.licenses    = []

  spec.files = Dir['{lib}/**/*']

  spec.required_ruby_version = ">= 2.3.0"

  spec.add_dependency "jekyll", ">= 3.7", "< 5.0"

  spec.add_runtime_dependency 'nokogiri', '~> 1.9'

  spec.add_development_dependency "pry", '~> 0.12.2'
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop-jekyll", "~> 0.4"
end
