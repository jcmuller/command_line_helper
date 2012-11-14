# TODO Check for definition of options_possible
#require 'active_support/concern'

module CommandLineHelper
  # Depends on:
  # * version_info (simply defined to return __PACKAGE__::VERSION)
  # * options_possible
  #     [ ['--option', '-o', GetoptLong::OPTION_TYPE, 'Helpful message'], ... ]
  class Base
    class << self
      def program_name
        @program_name = File.basename($0)
      end
    end

    # Help information that is constructed from the options_possible defined
    #
    # Returns the help text
    def help_info
      <<-EOH
Usage: #{program_name} [options]
  #{short_hand_options}

  Options:
#{option_details}
#{version_info}
      EOH
    end

    def version_info
      VERSION
    end

    def program_name
      self.class.program_name
    end

    private

    def options_possible
      raise %{Must override this with something like [ ['--option', '-o', GetoptLong::OPTION_TYPE, 'Helpful message'], ... ]}
    end

    def option_details
      <<-EOO
#{options_possible.map{ |o| expand_option(o) }.join("\n")}
      EOO
    end

    def expand_option(option)
      sprintf("    %-#{longest_width + 6}s %s", option.first(2).join(', '), option[3])
    end

    def longest_width
      @max_width ||= options_possible.map{ |o| o[0] }.max{ |a, b| a.length <=> b.length }.length
    end

    def short_hand_options
      "[#{options_possible.map{ |o| short_hand_option(o)}.join('], [')}]"
    end

    def short_hand_option(option)
      if option[2] == GetoptLong::REQUIRED_ARGUMENT
        [option[0], option[1]].join('|') << " argument"
      else
        [option[0], option[1]].join('|')
      end
    end

  end
end
