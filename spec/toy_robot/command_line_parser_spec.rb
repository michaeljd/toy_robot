require 'stringio'
require 'spec_helper'
require_relative '../../lib/toy_robot/command_line_parser'

RSpec.describe ToyRobot::CommandLineParser do
  let(:expected_commands) { ['one', 'two', 'three', 'four'] }
  let(:stubbed_command_parser) { instance_double(ToyRobot::CommandParser, call: true) }
  subject { ToyRobot::CommandLineParser.new(stubbed_command_parser) }

  before do
    io = StringIO.new
    expected_commands.each { |cmd| io.puts cmd }
    io.rewind

    $stdin = io
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
