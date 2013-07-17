require 'blabber/console'
require 'blabber/campfire'

module Blabber
  
  class Blabber

    def initialize(opts)
      @channels = []
      opts['console'] && (@channels << Console.new(opts['console']))
      opts['campfire'] && (@channels << Campfire.new(opts['campfire']))
    end

    def debug(message)
      process_message(message, 'DEBUG')
    end

    def info(message)
      process_message(message, 'INFO')
    end

    def warn(message)
      process_message(message, 'WARN')
    end

    def error(message)
      process_message(message, 'ERROR')
    end

    def process_message(message, loglevel)
      @channels.each do |channel|
        channel.emit(message, loglevel)
      end
    end

  end
end
