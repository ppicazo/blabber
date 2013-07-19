require 'blabber/channel'

module Blabber
  
  class Mock

    include Channel
    attr_reader :opts

    def initialize(opts)
      @opts = opts
    end

    def loglevels
      @opts['loglevels']
    end
    
    def speak(message, loglevel, opts)
      @opts['log'].set_data({"message" => message, "loglevel" => loglevel, "opts" => opts})
    end

  end

end
