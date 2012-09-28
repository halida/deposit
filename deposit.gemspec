$:.push File.dirname(__FILE__) + '/lib'

Gem::Specification.new do |gem|
  gem.name = "deposit"
  gem.authors = ["linjunhalida"]
  gem.date        = '2012-09-28'
  gem.description = "Rails plugin for saving additional data for model."
  gem.summary = "Saving additional data for rails model."
  gem.email = "linjunhalida@gmail.com"
  gem.homepage      = 'https://github.com/halida/deposit'

  gem.add_runtime_dependency 'rails', '~> 3.0'
  gem.add_development_dependency 'rspec', '~> 2.6'
  gem.add_development_dependency 'ammeter', '~> 0.2.8'
  gem.add_development_dependency 'sqlite3'
  gem.add_development_dependency 'mysql2', '~> 0.3.7'
  gem.add_development_dependency 'pg'
  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'guard-rspec'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ['lib']
  gem.version       = '0.0.2'
end
