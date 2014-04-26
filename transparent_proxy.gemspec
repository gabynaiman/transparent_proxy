Gem::Specification.new do |spec|
  spec.name          = 'transparent_proxy'
  spec.version       = '0.0.1'
  spec.authors       = ['Gabriel Naiman']
  spec.email         = ['gabynaiman@gmail.com']
  spec.description   = 'Transparent proxy'
  spec.summary       = 'Transparent proxy'
  spec.homepage      = 'https://github.com/gabynaiman/transparent_proxy'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest', '~> 4.7'
  spec.add_development_dependency 'minitest-great_expectations', '~> 0.0'
  spec.add_development_dependency 'turn', '~> 0.9'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'pry'
end
