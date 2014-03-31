# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/redirects/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-redirects"
  spec.version       = Rack::Redirects::VERSION
  spec.authors       = ['Lorenzo Masini']
  spec.email         = ['l.masini@cantierecreativo.net']
  spec.summary       = %q{Rack configurable redirects}
  spec.description   = %q{Rack configurable redirects}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rack', '>= 0.9.1'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'thor'
  spec.add_development_dependency 'tins'
end
