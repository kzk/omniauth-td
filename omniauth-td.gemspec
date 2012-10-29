# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-td/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kazuki Ohta"]
  gem.email         = ["kazuki.ohta@gmail.com"]
  gem.description   = %q{OmniAuth strategy for Treasure Data}
  gem.summary       = %q{OmniAuth strategy for Treasure Data}
  gem.homepage      = "https://github.com/treasure-data/omniauth-td"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-td"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Td::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'td-client', '~> 0.8.35'
  gem.add_development_dependency 'shotgun', '~> 0.9'
  gem.add_development_dependency 'sinatra', '~> 1.3.1'
end
