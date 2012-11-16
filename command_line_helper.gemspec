# -*- encoding: utf-8 -*-
require File.expand_path('../lib/command_line_helper/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Juan C. Müller"]
  gem.email         = ["jcmuller@gmail.com"]
  gem.description   = %q{Helper for CLI apps.}
  gem.summary       = %q{This library provides a module that helps with some common CLI tasks (mainly showing help texts and options)}
  gem.homepage      = ""

  gem.files         = Dir["lib/**/*"] +
    %w(command_line_helper.gemspec Gemfile LICENSE Rakefile README.md)
  gem.executables   = []
  gem.test_files    = Dir["spec/**/*"]
  gem.name          = "command_line_helper"
  gem.require_paths = ["lib"]
  gem.version       = CommandLineHelper::VERSION
end
