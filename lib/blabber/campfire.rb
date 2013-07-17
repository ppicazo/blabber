require 'blabber/channel'

module Blabber
  
  class Campfire

    include Channel
    attr_reader :opts

    require "broach"

    def initialize(opts)
      @opts = opts
      Broach.settings = @opts.keys.inject({'use_ssl' => true}) do |acc, key|
        if(['account', 'token'].include?(key))
          acc[key] = @opts[key]
        end 
        acc
      end
    end

    def loglevels
      @opts['loglevels']
    end
    
    def speak(message, loglevel, opts)
      msg_opts = {}
      if message.gsub(/\n|\r/, "") != message
        msg_opts[:type] = :paste
      end
      Broach.speak(@opts['room'], message, msg_opts)
    end

  end

end
