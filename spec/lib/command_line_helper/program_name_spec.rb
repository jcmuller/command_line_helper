require 'spec_helper'

class ProgramNameClass
  include CommandLineHelper::ProgramName
end

describe CommandLineHelper::ProgramName do

  subject { ProgramNameClass.new }

  describe "#program_name" do
    it { subject.program_name.should == "rspec" }

    it {
      subject.program_name
      subject.instance_variable_get(:"@program_name").should == "rspec"
    }
  end

end
