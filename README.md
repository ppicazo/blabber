Blabber
===

Blabber helps us monitor long running jobs without having to watch them in the terminal.

## Installation

```
$ gem install blabber
```

## Example

```ruby
require "blabber"
require 'blabber/channel'
  
class CustomConsole

  include Blabber::Channel
  attr_reader :opts

  def initialize(opts)
    @opts = opts
  end

  def speak(message, loglevel, opts)
    puts "[#{loglevel}] #{message}"
  end

end

blabber = Blabber::Blabber.new(
    'Blabber::Console' => {'loglevel' => 'DEBUG'},
    'CustomConsole' => {'loglevel' => 'DEBUG'},
    'Blabber::Campfire' => {
        'account' => 'campfireaccount', 
        'token' => 'abc123', 
        'room' => 'My Room',
        'loglevel' => 'INFO'
    })

blabber.debug("debug msg")
blabber.info("info msg")
blabber.error("error msg")
blabber.warn("warn msg")
blabber.debug("multiline\nmessage")
```