# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'assembly/version'

Gem::Specification.new do |spec|
  spec.name          = "assembly"
  spec.version       = Assembly::VERSION
  spec.authors       = ["Assembly Education"]
  spec.email         = ["developers@assembly.education"]

  spec.summary       = %q{Ruby client library for the Assembly Platform}
  spec.homepage      = "http://platform.assembly.education"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday",            "> 0.9.0"
  spec.add_dependency "faraday_middleware", "> 0.9.0"

  spec.add_development_dependency "bundler",            "~> 1.9"
  spec.add_development_dependency "rake",               "~> 10.0"
  spec.add_development_dependency "mocha",              "~> 1.1.0"
  spec.add_development_dependency "webmock",            "~> 1.21.0"
  spec.add_development_dependency "guard",              "~> 2.12.5"
  spec.add_development_dependency "guard-minitest",     "~> 2.4.4"
  spec.add_development_dependency "minitest-reporters", "~> 1.0"
end
