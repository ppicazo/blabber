module Blabber

  module Channel


    def emit(message, loglevel, opts = nil)
     if should_emit(loglevel)
       speak(message, loglevel, opts)
      end
    end

    private
    def should_emit(loglevel)
       loglevels.include?(loglevel)
    end

  end

end
