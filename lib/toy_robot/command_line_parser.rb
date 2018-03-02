module ToyRobot
  class CommandLineParser
    def initialize(command_parser)
      @command_parser = command_parser
    end

    def call
      while cmd = gets do
        @command_parser.call(cmd.strip)
      end
    end
  end
end
