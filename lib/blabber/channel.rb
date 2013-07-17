module Blabber

  class Channel

    def loglevelnumeric()
      case @opts['loglevel']
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