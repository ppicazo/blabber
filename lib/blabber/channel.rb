module Blabber

  module Channel

    @@loglevels = ["DEBUG", "INFO", "WARN", "ERROR"]

    def emit(message, loglevel, opts = nil)
     if should_emit(loglevel)
       speak(message, loglevel, opts)
      end
    end

    private
    def should_emit(loglevel)
      raise "Unknown log level #{loglevel}" unless @@loglevels.index(loglevel)
      @@loglevels.index(opts['loglevel']) <= @@loglevels.index(loglevel)
    end

  end

end
