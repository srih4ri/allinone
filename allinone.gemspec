# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'allinone/version'

Gem::Specification.new do |spec|
  spec.name          = "allinone"
  spec.version       = Allinone::VERSION
  spec.authors       = ["Unni"]
  spec.email         = ["unni.tallman@gmail.com"]
  spec.summary       = %q{Makes a Rails app multitenant}
  spec.description   = %q{Makes it possible to serve multiple sites from the same app}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "request_store"
end
