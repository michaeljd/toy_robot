module ToyRobot
  module CommandHandlers
    class Report
      include Squirrel::CommandHandlerHelpers

      def call(cmd)
        with_aggregate(Domain::Robot, cmd.robot_id) do |robot|
          position = robot.report

          puts "Robot is currently at (#{position[:north]}, #{position[:east]}) and it's facing #{position[:direction]}"
        end
      end
    end
  end
end

Squirrel.command_bus.register(ToyRobot::Commands::Report, ToyRobot::CommandHandlers::Report.new)
