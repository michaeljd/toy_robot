require 'squirrel'

Mongo::Logger.logger.level = Logger::FATAL

module ToyRobot
  Error = Class.new(RuntimeError)
end

require_relative 'toy_robot/types'

Dir["#{File.dirname(__FILE__)}/toy_robot/commands/*.rb"].each { |f| require f }
Dir["#{File.dirname(__FILE__)}/toy_robot/command_handlers/*.rb"].each { |f| require f }
Dir["#{File.dirname(__FILE__)}/toy_robot/domain/*.rb"].each { |f| require f }
