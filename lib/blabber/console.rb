require 'blabber/channel'

module Blabber
  
  class Console

    include Channel
    attr_reader :opts

    def initialize(opts)
      @opts = opts
    end

    def loglevels
      @opts['loglevels']
    end
    
    def speak(message, loglevel, opts)
      puts message
    end

  end

end
