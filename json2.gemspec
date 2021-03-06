# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'json2/version'

Gem::Specification.new do |spec|
  spec.name          = "json2"
  spec.version       = Json2::VERSION
  spec.authors       = ["lkdjiin"]
  spec.email         = ["xavier.nayrac@gmail.com"]
  spec.summary       = %q{Transform json to csv.}
  spec.description   = %q{json2 takes a json file as input and outputs a clean
                          csv.}
  spec.homepage      = "https://github.com/lkdjiin/json2"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "reek", "~> 3.0"
  spec.add_development_dependency "coco", "~> 0.13.0"
  spec.add_development_dependency "flay"
end
