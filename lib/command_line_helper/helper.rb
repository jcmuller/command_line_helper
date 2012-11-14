# TODO Check for definition of options_possible
#require 'active_support/concern'

module CommandLineHelper
  module Helper
    # Provides:
    #     * Requires on options_possible to be defined and return an array of the form:
    #       [ ['--option', '-o', GetoptLong::OPTION_TYPE, 'Helpful message'], ... ]
    #   - help_info
    #   - program_name
    #   - short_hand_options (used inside help_info)
    #   - option_details (used inside help_info)
    #   - longest_width
    #   - expand_option
    #
    #
    def help_info
      <<-EOH
Usage: #{program_name} [options]
  #{short_hand_options}

  Options:
#{option_details}
#{version_info}
      EOH
    end

    def program_name
      @@program_name = File.basename($0)
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

    def option_details
      <<-EOO
#{options_possible.map{ |o| expand_option(o) }.join("\n")}
      EOO
    end

    def longest_width
      @max_width ||= options_possible.map{ |o| o[0] }.max{ |a, b| a.length <=> b.length }.length
    end

    def expand_option(option)
      sprintf("    %-#{longest_width + 6}s %s", option.first(2).join(', '), option[3])
    end

  end
end
