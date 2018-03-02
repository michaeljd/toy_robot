module ToyRobot
  module CommandHandlers
    class Right
      include Squirrel::CommandHandlerHelpers

      def call(cmd)
        with_aggregate(Domain::Robot, cmd.robot_id) do |robot|
          robot.right
        end
      end
    end
  end
end

Squirrel.command_bus.register(ToyRobot::Commands::Right, ToyRobot::CommandHandlers::Right.new)
