module ToyRobot
  module Commands
    class Place < Base
      def validate!
        north, east, direction = @args.split(',')

        @north = Types::Coercible::Int[north]
        @east = Types::Coercible::Int[east]
        @direction = Types::Direction[direction]
      end

      attr_reader :north, :east, :direction
    end
  end
end
