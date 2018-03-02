require 'spec_helper'
require_relative '../../lib/toy_robot/command_parser'

RSpec.describe ToyRobot::CommandParser do
  subject { ToyRobot::CommandParser.new }

  describe '#call' do
    context "when given the 'PLACE' command" do
      it 'instructs the robot to be placed in the specified position' do
        expect(Squirrel.command_bus).to receive(:call).with kind_of(ToyRobot::Commands::Place)

        subject.call('PLACE 0,1,SOUTH')
      end
    end

    context "when given the 'MOVE' command" do
      it 'instructs the robot to move' do
        expect(Squirrel.command_bus).to receive(:call).with kind_of(ToyRobot::Commands::Move)

        subject.call('MOVE')
      end
    end

    context "when given the 'RIGHT' command" do
      it 'instructs the robot to turn right' do
        expect(Squirrel.command_bus).to receive(:call).with kind_of(ToyRobot::Commands::Right)

        subject.call('RIGHT')
      end
    end

    context "when given the 'LEFT' command" do
      it 'instructs the robot to turn left' do
        expect(Squirrel.command_bus).to receive(:call).with kind_of(ToyRobot::Commands::Left)

        subject.call('LEFT')
      end
    end

    context "when given the 'REPORT' command" do
      it 'outputs a string describing the current position and direction' do
        expect(Squirrel.command_bus).to receive(:call).with kind_of(ToyRobot::Commands::Report)

        subject.call("REPORT")
      end
    end

    context 'when given an invalid command' do
      it 'raises an exception' do
        expect { subject.call('BING') }.to raise_error(NameError)
      end
    end
  end
end
