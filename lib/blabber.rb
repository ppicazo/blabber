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

    def debug(message)
      process_message(message, 'DEBUG')
    end

    def info(message)
      process_message(message, 'INFO')
    end

    def warn(message)
      process_message(message, 'WARN')
    end

    def error(message)
      process_message(message, 'ERROR')
    end

    def process_message(message, loglevel)
      @channels.each do |channel|
        channel.emit(message, loglevel)
      end
    end

  end
end
