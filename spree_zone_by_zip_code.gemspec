# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_zone_by_zip_code'
  s.version     = '3.0.1'
  s.summary     = 'Adds ability to create zones by zip code in spree'
  s.description = 'Creates Spree::ZipCode. This zip code model is zoneable and belongs to a Spree::State'
  s.required_ruby_version = '>= 2.0.0'

  s.author    = 'David Rozenberg'
  s.email     = 'david@breakoutdigital.com'
  s.homepage  = 'http://www.breakoutdigital.com'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 3.0.1'

  s.add_development_dependency 'capybara', '~> 2.4'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 3.1'
  s.add_development_dependency 'sass-rails', '~> 5.0.0.beta1'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
