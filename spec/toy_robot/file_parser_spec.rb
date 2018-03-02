require 'spec_helper'
require_relative '../../lib/toy_robot/file_parser'

RSpec.describe ToyRobot::FileParser do
  let(:expected_commands) { ['1', '2', '3', '4'] }
  let(:stubbed_command_parser) { instance_double(ToyRobot::CommandParser, call: true) }
  subject { ToyRobot::FileParser.new(stubbed_command_parser, 'test_file.txt') }

  before do
    allow(File).to receive(:read).and_return(expected_commands.join("\n"))
  end

  describe '#call' do
    it 'passes commands from the file specified to the command parser' do
      subject.call

      expected_commands.each do |cmd|
        expect(stubbed_command_parser).to have_received(:call).with(cmd)
      end
    end
  end
end
