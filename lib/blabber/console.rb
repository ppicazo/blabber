require 'blabber/channel'

module Blabber
  
  class Console

    include Channel
    attr_reader :opts

    def initialize(opts)
      @opts = opts
    end

    def speak(message)
      puts message
    end

  end

end
