require 'matrix'

module ToyRobot
  module Domain
    class Robot
      include Squirrel::Aggregate

      NotPlaced = Class.new(ToyRobot::Error)
      InvalidMove = Class.new(ToyRobot::Error)

      def initialize(robot_id)
        @aggregate_id = robot_id
      end

      def place(north:, east:, direction:)
        apply Squirrel::Event.new(
          type: 'robot.placed',
          aggregate_id: aggregate_id,
          data: { north: north, east: east, direction: direction }
        )
      end

      def move
        raise NotPlaced unless @placed
        raise InvalidMove unless can_move?

        apply Squirrel::Event.new(
          type: 'robot.moved',
          aggregate_id: aggregate_id
        )
      end

      def left
        raise NotPlaced unless @placed

        apply Squirrel::Event.new(
          type: 'robot.turned_left',
          aggregate_id: aggregate_id
        )
      end

      def right
        raise NotPlaced unless @placed

        apply Squirrel::Event.new(
          type: 'robot.turned_right',
          aggregate_id: aggregate_id
        )
      end

      def report
        raise NotPlaced unless @placed

        { north: north, east: east, direction: direction }
      end

      attr_reader :north, :east, :direction

      private

      attr_reader :aggregate_id

      def can_move?
        (0...5).cover?(next_position[0]) && (0...5).cover?(next_position[1])
      end

      def vectors
        {
          'NORTH' => Vector[1,0],
          'EAST' => Vector[0,1],
          'SOUTH' => Vector[-1,0],
          'WEST' => Vector[0,-1]
        }
      end

      def next_position
        (Vector[north, east] + vectors[direction]).to_a
      end

      def next_direction(dir)
        vectors.keys.tap do |v|
          v.rotate! until v.first == direction
          return v[dir]
        end
      end

      def apply_robot_placed(event)
        @north = event.data[:north]
        @east = event.data[:east]
        @direction = event.data[:direction]
        @placed = true
      end

      def apply_robot_moved(event)
        @north = next_position[0]
        @east = next_position[1]
      end

      def apply_robot_turned_left(event)
        @direction = next_direction(-1)
      end

      def apply_robot_turned_right(event)
        @direction = next_direction(1)
      end
    end
  end
end
