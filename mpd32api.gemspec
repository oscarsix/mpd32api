# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mpd32api/version'

Gem::Specification.new do |spec|
  spec.name          = 'mpd32api'
  spec.version       = Mpd32Api::VERSION
  spec.authors       = ['Oskar Malnowicz']
  spec.email         = %w(oscarsix@gmail.com)
  spec.description   = %q{Control akai mpd32}
  spec.summary       = %q{Send midi sysex to the device}
  spec.homepage      = 'https://github.com/oscarsix'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'

  spec.add_dependency 'unimidi'
end
