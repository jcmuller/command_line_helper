module CommandLineHelper
  module ProgramName

    def program_name
      @program_name ||= File.basename($0)
    end

  end
end
