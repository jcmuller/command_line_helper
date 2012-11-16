require "rubygems"
require "getoptlong"

module CommandLineHelper
  autoload :Help, 'command_line_helper/help'
  autoload :ProgramName, 'command_line_helper/program_name'
  autoload :VERSION, 'command_line_helper/version'
end
