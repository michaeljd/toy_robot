module ToyRobot
  module CommandHandlers
    class Move
      include Squirrel::CommandHandlerHelpers

      def call(cmd)
        with_aggregate(Domain::Robot, cmd.robot_id) do |robot|
          robot.move
        end
      end
    end
  end
end

Squirrel.command_bus.register(ToyRobot::Commands::Move, ToyRobot::CommandHandlers::Move.new)
