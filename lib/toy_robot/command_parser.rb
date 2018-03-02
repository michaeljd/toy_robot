require 'securerandom'

module ToyRobot
  class CommandParser
    include Squirrel::CommandHelpers

    def initialize(robot_id = SecureRandom.uuid)
      @robot_id = robot_id
    end

    def call(input)
      cmd, _sep, args = input.strip.partition(' ')
      command = ToyRobot::Commands.const_get(cmd.capitalize).new(robot_id: @robot_id, args: args)
      execute(command)
    rescue ToyRobot::Error
    end
  end
end
