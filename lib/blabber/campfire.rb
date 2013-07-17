module Blabber
  
  class Campfire

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

    def speak(message)
      msg_opts = {}
      if message.gsub(/\n|\r/, "") != message
        msg_opts[:type] = :paste
      end
      Broach.speak(@opts['room'], message, msg_opts)
    end

  end

end