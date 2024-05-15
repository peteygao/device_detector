# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'device_detector/version'

Gem::Specification.new do |spec|
  spec.name          = 'device_detector'
  spec.version       = DeviceDetector::VERSION
  spec.authors       = ['Mati Sójka', 'Ben Zimmer']
  spec.email         = ['yagooar@gmail.com']
  spec.summary       = %q{Precise and fast user agent parser and device detector}
  spec.description   = %q{Precise and fast user agent parser and device detector, backed by the largest and most up-to-date agent and device database}
  spec.homepage      = 'http://podigee.github.io/device_detector'
  spec.license       = 'LGPL-3.0'
  spec.metadata      = { 'changelog_uri' => 'https://github.com/podigee/device_detector/blob/develop/CHANGELOG.md' }

  spec.files         = Dir["{lib,regexes}/**/*", "README.md", "LICENSE.txt", "CHANGELOG.md"]
  spec.executables   = []
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.7.5'

  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry', '>= 0.10'
  spec.add_development_dependency 'rubocop', '0.85.1'
end
