require 'spec_helper'

describe CommandLineHelper::Base do
  it { expect{ subject.help_info }.to raise_error }

  context do
    before do
      subject.stub(:options_possible).and_return(
        [ ['--foo', '-f', 1, 'Fooism'], ['--bar', '-b', 2, 'Bark'] ]
      )
    end

    describe "#program_name" do
      it { subject.program_name.should == "rspec" }

      it {
        described_class.should_receive(:program_name)
        subject.program_name
      }

      it {
        subject.program_name
        described_class.instance_variable_get(:"@program_name").should == "rspec"
      }
    end

    describe "#help_info" do
      it "should return the nice string" do
        subject.should_receive(:program_name)
        subject.should_receive(:short_hand_options)
        subject.should_receive(:option_details)
        subject.should_receive(:version_info)

        subject.send(:help_info)
      end

      it "should return helpful information based on options" do
        File.stub(:basename).and_return("program_name")
        subject.stub(:version_number).and_return("version")
        subject.send(:help_info).should == <<-EOH
Usage: program_name [options]
  [--foo|-f argument], [--bar|-b]

  Options:
    --foo, -f   Fooism
    --bar, -b   Bark

0.0.1
        EOH
      end
    end

    describe "#option_details" do
      it "should return nice things" do
        subject.send(:option_details).should ==
          "    --foo, -f   Fooism\n    --bar, -b   Bark\n"
      end
    end

    describe "#short_hand_option" do
      it "should return '--foo|-f argument'" do
        option = ["--foo", "-f", GetoptLong::REQUIRED_ARGUMENT]
        subject.send(:short_hand_option, option).should == "--foo|-f argument"
      end

      it "should return '--bar|-b'" do
        option = ["--bar", "-b", nil]
        subject.send(:short_hand_option, option).should == "--bar|-b"
      end
    end

  end
end
