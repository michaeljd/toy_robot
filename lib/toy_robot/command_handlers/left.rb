module ToyRobot
  module CommandHandlers
    class Left
      include Squirrel::CommandHandlerHelpers

      def call(cmd)
        with_aggregate(Domain::Robot, cmd.robot_id) do |robot|
          robot.left
        end
      end
    end
  end
end

Squirrel.command_bus.register(ToyRobot::Commands::Left, ToyRobot::CommandHandlers::Left.new)
