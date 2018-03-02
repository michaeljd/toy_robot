module ToyRobot
  module Commands
    class Base < Squirrel::Command
      attribute :robot_id, Types::Strict::String
      attribute :args, Types::Strict::String.optional

      def initialize(*args)
        super

        validate!
      end

      def validate!
      end
    end
  end
end
