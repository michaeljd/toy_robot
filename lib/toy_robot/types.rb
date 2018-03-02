module ToyRobot
  module Types
    include Dry::Types.module

    Direction = Strict::String.enum('NORTH', 'SOUTH', 'EAST', 'WEST')
  end
end
