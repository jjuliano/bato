
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bato/bersiyon'

Gem::Specification.new do |spec|
  spec.name          = 'bato'
  spec.version       = Bato::BERSIYON
  spec.authors       = ['Joel Bryan Juliano']
  spec.email         = ['joelbryan.juliano@gmail.com']
  spec.description   = 'Bato Programming Language'
  spec.summary       = 'Ang Bato ay isang programming language sa wikang Tagalog'
  spec.homepage      = 'https://github.com/jjuliano/bato'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'ruby2ruby', '~> 2.4'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 12.2'
  spec.add_development_dependency 'rspec', '~> 3.7'
end
