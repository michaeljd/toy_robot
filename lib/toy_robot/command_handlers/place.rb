module ToyRobot
  module CommandHandlers
    class Place
      include Squirrel::CommandHandlerHelpers

      def call(cmd)
        with_aggregate(Domain::Robot, cmd.robot_id) do |robot|
          robot.place(north: cmd.north, east: cmd.east, direction: cmd.direction)
        end
      end
    end
  end
end

Squirrel.command_bus.register(ToyRobot::Commands::Place, ToyRobot::CommandHandlers::Place.new)
