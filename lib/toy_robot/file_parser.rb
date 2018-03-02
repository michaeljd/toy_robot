module ToyRobot
  class FileParser
    def initialize(command_parser, filename)
      @command_parser = command_parser
      @filename = filename
    end

    def call
      commands = File.read(@filename).split("\n")

      commands.each(&@command_parser.method(:call))
    end
  end
end
