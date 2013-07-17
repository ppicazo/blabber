require 'blabber/console'
require 'blabber/campfire'

module Blabber
  
  class Blabber

    def initialize(opts)
      @channels = opts.keys.map do |channel_name|\
        class_object = channel_name.split("::").inject(Object) do |acc, component|
          acc.const_get(component)
        end
        class_object.new(opts[channel_name])
      end
    end

    def method_missing(method_name, *args)
      process_message(args[0], method_name.to_s.upcase, args[1])
    end 

    def process_message(message, loglevel, opts)
      @channels.each do |channel|
        channel.emit(message, loglevel, opts)
      end
    end

  end
end
