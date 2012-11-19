# CommandLineHelper
[![Build Status](https://secure.travis-ci.org/jcmuller/command_line_helper.png?branch=master)](http://travis-ci.org/jcmuller/command_line_helper)
[![Dependency Status](https://gemnasium.com/jcmuller/command_line_helper.png "Dependency Status")](https://gemnasium.com/jcmuller/command_line_helper)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/jcmuller/command_line_helper)


This helps other gems with their common CLI chores.

At the moment, it generates a nice help output based on `options_possible` defined in the
class that includes `CommandLineHelper::HelpText`.

## Installation

Add this line to your application's Gemfile:

    gem 'command_line_helper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install command_line_helper

## Usage

```ruby
require 'command_line_helper'

class CLI
  include CommandLineHelper::HelpText

  def do_something
    puts help_info
  end

  private

  def options_possible
    [
      ['--foo', '-f', GetoptLong::REQUIRED_ARGUMENT, "This option foo takes an argument"],
      ['--bar', '-f', GetoptLong::NO_ARGUMENT, "This option bar does not take an argument"]
    ]
  end

  def version_info
    "This is version BLAH of this amazing package. (c) Someone Somewhere Today."
  end

end

CLI.new.do_something
```

```bash
$ ruby ./cli.rb
Usage: cli.rb [options]
  [--foo|-f argument], [--bar|-f]

  Options:
    --foo, -f   This option foo takes an argument
    --bar, -f   This option bar does not take an argument

This is version BLAH of this amazing package. (c) Someone Somewhere Today.
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
