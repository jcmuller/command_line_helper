require "rubygems"
require "getoptlong"

module CommandLineHelper
  autoload :HelpText, 'command_line_helper/help_text'
  autoload :ProgramName, 'command_line_helper/program_name'
  autoload :VERSION, 'command_line_helper/version'
end
