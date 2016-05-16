Gem::Specification.new do |s|
  s.name        = 'gi-dom-rails'
  s.version     = '0.1.0'
  s.summary     = 'Garber-Irish DOM-ready Execution'
  s.description = 'Execute page specific JS by controller path and method name'
  s.author      = 'Irmantas Baciulis'
  s.email       = 'i.baciulis@gmail.com'
  s.homepage    = 'https://github.com/ibaciulis/gi-dom-rails'
  s.license     = 'MIT'
  s.files       = `git ls-files`.split("\n")

  s.required_ruby_version = '>= 2.0.0'

  s.add_dependency 'underscore-rails', '~> 1.7'
  s.add_dependency 'rails-assets-underscore.string'
end