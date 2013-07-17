require 'blabber/campfire'

module Blabber
  
  class Blabber

    @@level = { "DEBUG" => 0, "INFO" => 1, "WARN" => 2, "ERROR" => 3}

    def initialize(opts)
        @campfire = opts['campfire'] && Campfire.new(opts['campfire'])
    end

    def debug(message)
      processMessage(message, 'DEBUG')
    end

    def info(message)
      processMessage(message, 'INFO')
    end

    def warn(message)
      processMessage(message, 'WARN')
    end

    def error(message)
      processMessage(message, 'ERROR')
    end

    def processMessage(message, loglevel)
      console message
      if @campfire && @campfire.loglevelnumeric <= @@level['ERROR']
        @campfire.speak(message)
      end
    end

    def console(message)
      puts message
    end

  end
end
