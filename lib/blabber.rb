require 'blabber/campfire'

module Blabber
  
  class Blabber

    @@level = { "DEBUG" => 0, "INFO" => 1, "WARN" => 2, "ERROR" => 3}

    def initialize(opts)

        @opts = opts
        @campfire = @opts['campfire'] && Campfire.new(@opts['campfire'])

    end

    def debug(message)
      console message
      if @campfire && loglevelnumeric <= @@level['DEBUG']
        @campfire.speak(message)
      end
    end

    def info(message)
      console message
      if @campfire && loglevelnumeric <= @@level['INFO']
        @campfire.speak(message)
      end
    end

    def warn(message)
      console message
      if @campfire && loglevelnumeric <= @@level['WARN']
        @campfire.speak(message)
      end
    end

    def error(message)
      console message
      if @campfire && loglevelnumeric <= @@level['ERROR']
        @campfire.speak(message)
      end
    end

    def console(message)
      puts message
    end

    def loglevelnumeric()
      case @opts['campfire']['loglevel']
      when "DEBUG"
        return 0
      when "INFO"
        return 1
      when "WARN"
        return 2
      when "ERROR"
        return 3
      end
    end

  end
end
