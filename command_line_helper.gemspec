# -*- encoding: utf-8 -*-
require File.expand_path('../lib/command_line_helper/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Juan C. Müller"]
  gem.email         = ["jcmuller@gmail.com"]
  gem.description   = %q{Helper for CLI apps.}
  gem.summary       = %q{This library provides a module that helps with some common CLI tasks (mainly showing help texts and options)}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "command_line_helper"
  gem.require_paths = ["lib"]
  gem.version       = CommandLineHelper::VERSION
end
