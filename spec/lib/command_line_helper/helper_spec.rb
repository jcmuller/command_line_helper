require 'spec_helper'

class CommandLineHelperHelperSpec < CommandLineHelper::Base
  def options_possible
    [ ['--blah', '-b', GetoptLong::NO_ARGUMENT, 'Helpful!' ] ]
  end
end

describe CommandLineHelper::Base do
  subject { CommandLineHelperHelperSpec.new }

  describe "#help_info" do
    it "should return the nice string" do
      subject.should_receive(:program_name)
      subject.should_receive(:short_hand_options)
      subject.should_receive(:option_details)
      subject.should_receive(:version_info)

      subject.send(:help_info)
    end
  end
end
