# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iconik/version'

Gem::Specification.new do |spec|
  spec.name          = "iconik"
  spec.version       = Iconik::VERSION
  spec.authors       = ["kazuaking"]
  spec.email         = ["kazuaki.it@gmail.com"]
  spec.summary       = %q{This library gets the icon from the page of GooglePlay and the iTunes store.}
  spec.description   = %q{This library gets the icon from the page of GooglePlay and the iTunes store.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "coveralls"
end
