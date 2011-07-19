require 'rubygems/specification'

Gem::Specification.new do |spec|

  spec.name = 'capedia'
  spec.version = '0.0.9'

  spec.platform = Gem::Platform::RUBY
  spec.summary = 'Common capistrano plugins and recipes'
  spec.description = %q{
    A collection of capistrano plugins and recipes. Recipes include passenger, pre installing gems like bundler, 
    installing gems (i.e. rake gems:install), symlinking config files, updating crontab, and more ...
  }

  spec.author = 'Ryan Wilson'
  spec.email = 'rwilson@corpedia.com'
  spec.homepage = ''
  spec.rubyforge_project = ''

  spec.files = Dir.glob 'lib/**/*'

end
