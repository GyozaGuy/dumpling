require_relative 'lib/dumpling/version'

Gem::Specification.new do |spec|
  spec.name        = 'dumpling'
  spec.version     = Dumpling::VERSION
  spec.authors     = ['GyozaGuy']
  spec.email       = ['gyozaguy@gmail.com']
  spec.homepage    = 'https://gyozaguy.com'
  spec.summary     = 'A simple transpile-free UI toolkit'
  spec.description = 'Dumpling is a simple transpile-free UI toolkit for Ruby on Rails.'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.0.0'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/GyozaGuy/dumpling'
  # spec.metadata['changelog_uri'] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'importmap-rails'
  spec.add_dependency 'rails', '>= 7.0.4'
  spec.add_dependency 'view_component'
end
