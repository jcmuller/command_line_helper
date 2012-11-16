# TODO Check for definition of options_possible
require 'active_support/concern'

module CommandLineHelper
  module ProgramName

    def program_name
      @program_name ||= File.basename($0)
    end

  end
end
