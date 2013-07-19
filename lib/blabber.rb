require 'blabber/console'
require 'blabber/mock'

module Blabber
  
  class Blabber

    def initialize(opts)
      @channels = Array.new
      opts.each do |channel|\
        class_object = channel["channel"].split("::").inject(Object) do |acc, component|
          acc.const_get(component)
        end
        @channels << class_object.new(channel)
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
