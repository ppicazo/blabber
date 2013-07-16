module Blabber
  
  class Blabber

    require "broach"

    @@settings = {}

    @@level = { "DEBUG" => 0, "INFO" => 1, "WARN" => 2, "ERROR" => 3}

    def initialize(account, token, room, loglevel)

      if account.nil? || token.nil? || room.nil? || loglevel.nil?
        @@settings = { "campfire" => { "enabled" => false } }
      else
        @@settings = {
          "campfire" => {
            "enabled" => true,
            "account" => account,
            "token" => token,
            "room" => room,
            "loglevel" => loglevel
          }
        }

        Broach.settings = {
          'account' => @@settings['campfire']['account'],
          'token'   => @@settings['campfire']['token'],
          'use_ssl' => true
        }
      end

    end

    def debug(message)
      console message
      if @@settings['campfire']['enabled'] && loglevelnumeric <= @@level['DEBUG']
        speak(message)
      end
    end

    def info(message)
      console message
      if @@settings['campfire']['enabled'] && loglevelnumeric <= @@level['INFO']
        speak(message)
      end
    end

    def warn(message)
      console message
      if @@settings['campfire']['enabled'] && loglevelnumeric <= @@level['WARN']
        speak(message)
      end
    end

    def error(message)
      console message
      if @@settings['campfire']['enabled'] && loglevelnumeric <= @@level['ERROR']
        speak(message)
      end
    end

    def console(message)
      puts message
    end

    def speak(message)
      Broach.speak(@@settings['campfire']['room'], message)
    end

    def loglevelnumeric()
      case @@settings['campfire']['loglevel']
      when "DEBUG"
        return 0
      when "INFO"
        return 1
      when "WARN"
        return 2
      when "ERROR"
        return 3
      end
    end

  end
end
